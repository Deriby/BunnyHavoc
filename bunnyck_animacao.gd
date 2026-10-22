extends RefCounted
## Adaptação visual do bunnyckAnimator da Fase 1. Não altera física nem colisões.
## Giro, combo, dano e cutscenes serão migrados nas próximas etapas.

var estado: String = "idle"
var estado_anterior: String = "idle"
var _corpo: Node3D
var _pernas: Array[Node3D] = []
var _bracos: Array[Node3D] = []
var _orelhas: Array[Node3D] = []
var _cauda: Node3D
var _palpebras: Array[MeshInstance3D] = []
var _posicao_base: Vector3
var _escala_base: Vector3
var _rotacao_base: Vector3
var _passada: float = 0.0
var _estava_no_chao: bool = true
var _velocidade_queda: float = 0.0
var _idade_salto: float = 1.0
var _idade_pouso: float = 1.0
var _peso_pouso: float = 0.0
var _rapidez_anterior: float = 0.0
var _rumo: float = 0.0
var _relogio_piscada: float = 1.8
var _piscada_restante: float = 0.0
var _respiracao: float = 0.0
var _tempo: float = 0.0
var _pronto: bool = false

func configurar(visual: Node3D) -> void:
	if visual == null:
		return
	_corpo = visual
	_pernas = [visual.find_child("Perna_E", true, false) as Node3D, visual.find_child("Perna_D", true, false) as Node3D]
	_bracos = [visual.find_child("Braco_E", true, false) as Node3D, visual.find_child("Braco_D", true, false) as Node3D]
	_orelhas = [visual.find_child("Orelha_E", true, false) as Node3D, visual.find_child("Orelha_D", true, false) as Node3D]
	_cauda = visual.find_child("Cauda", true, false) as Node3D
	for pivo in _pernas + _bracos + _orelhas + [_cauda]:
		if pivo == null:
			push_warning("Animação do Bunnyck: use o GLB original com os pivôs nomeados.")
			return
	# Three.js usa Euler XYZ. Manter a ordem evita mudar poses ao combinar eixos.
	_corpo.rotation_order = EULER_ORDER_XYZ
	for pivo in _pernas + _bracos + _orelhas + [_cauda]:
		pivo.rotation_order = EULER_ORDER_XYZ
	_posicao_base = _corpo.position
	_escala_base = _corpo.scale
	_rotacao_base = _corpo.rotation
	_criar_palpebras()
	_pronto = true
	reiniciar()

func _criar_palpebras() -> void:
	# As mesmas duas pálpebras que o animator original cria depois da geometria.
	# Compartilham malha/material e são criadas só uma vez, nunca por quadro.
	var modelo: Node3D = _pernas[0].get_parent() as Node3D
	var malha := BoxMesh.new()
	malha.size = Vector3(0.165, 0.195, 0.046)
	var folha: MeshInstance3D = _orelhas[0].find_children("*", "MeshInstance3D", true, false)[0] as MeshInstance3D
	for i in 2:
		var nome: String = "Palpebra_E" if i == 0 else "Palpebra_D"
		var palpebra := modelo.get_node_or_null(nome) as MeshInstance3D
		if palpebra == null:
			palpebra = MeshInstance3D.new()
			palpebra.name = nome
			palpebra.mesh = malha
			palpebra.material_override = folha.get_active_material(0)
			palpebra.position = Vector3((-1.0 if i == 0 else 1.0) * 0.2, 1.76, 0.515)
			modelo.add_child(palpebra)
		palpebra.visible = false
		_palpebras.append(palpebra)

func reiniciar() -> void:
	if not _pronto:
		return
	_passada = 0.0
	_estava_no_chao = true
	_velocidade_queda = 0.0
	_idade_salto = 1.0
	_idade_pouso = 1.0
	_peso_pouso = 0.0
	_rapidez_anterior = 0.0
	_rumo = _rotacao_base.y
	_relogio_piscada = 1.8
	_piscada_restante = 0.0
	_respiracao = 0.0
	estado = "idle"
	estado_anterior = "idle"
	_corpo.position = _posicao_base
	_corpo.rotation = _rotacao_base
	_corpo.scale = _escala_base
	for pivo in _bracos + _pernas + _orelhas:
		pivo.rotation = Vector3.ZERO
	_orelhas[0].rotation.z = 0.1
	_orelhas[1].rotation.z = -0.1
	_cauda.rotation = Vector3.ZERO
	_cauda.scale = Vector3.ONE
	for palpebra in _palpebras:
		palpebra.visible = false

func _suavizar(atual: float, alvo: float, taxa: float, dt: float) -> float:
	return lerpf(atual, alvo, 1.0 - exp(-taxa * dt))

func _ease(valor: float) -> float:
	var x: float = clampf(valor, 0.0, 1.0)
	return x * x * (3.0 - 2.0 * x)

func _pose(pivo: Node3D, eixo: int, alvo: float, taxa: float, dt: float) -> void:
	var angulos: Vector3 = pivo.rotation
	angulos[eixo] = _suavizar(angulos[eixo], alvo, taxa, dt)
	pivo.rotation = angulos

func atualizar(delta: float, velocidade: Vector3, no_chao: bool, correndo: bool, tem_direcao: bool) -> void:
	if not _pronto:
		return
	var dt: float = clampf(delta, 0.0, 0.05)
	_tempo += dt
	var rapidez: float = Vector2(velocidade.x, velocidade.z).length()
	var movendo: bool = rapidez > 0.55 and tem_direcao and no_chao
	var sprint: bool = correndo and movendo
	var no_ar: bool = not no_chao
	if _estava_no_chao and no_ar and velocidade.y > 0.0:
		_idade_salto = 0.0
	if no_ar:
		_idade_salto += dt
	if not _estava_no_chao and no_chao:
		_idade_pouso = 0.0
		_peso_pouso = clampf((-_velocidade_queda - 2.0) / 13.0, 0.28, 1.0)
	if no_chao:
		_idade_pouso += dt
	var pouso: float = pow(1.0 - _ease(_idade_pouso / 0.26), 1.35) * _peso_pouso if no_chao else 0.0
	var lancando: bool = no_ar and _idade_salto < 0.16
	estado_anterior = estado
	if no_ar:
		estado = "rise" if velocidade.y > 1.1 else "fall"
	elif pouso > 0.06:
		estado = "land"
	elif movendo:
		estado = "sprint" if sprint else "run"
	else:
		estado = "brake" if rapidez > 1.3 else "idle"
	var ritmo: float = clampf(rapidez / 10.3, 0.0, 1.15)
	_passada += dt * ((18.8 if sprint else 13.4) * (0.45 + ritmo * 0.55) if movendo else 3.2)
	_respiracao += dt
	var ciclo: float = pow(absf(sin(_passada)), 1.15) if movendo else 0.0
	var inicio_salto: float = 1.0 - _ease(_idade_salto / 0.16) if lancando else 0.0
	var desacelerando: float = clampf(_rapidez_anterior / 10.0, 0.0, 0.9) if no_chao and not movendo and _rapidez_anterior > 1.0 else 0.0
	var freando: float = clampf((_rapidez_anterior - rapidez) / 6.0, 0.0, 1.0) * desacelerando
	if rapidez > 1.1:
		var alvo: float = atan2(velocidade.x, velocidade.z)
		_rumo += angle_difference(_rumo, alvo) * (1.0 - exp(-dt * (11.0 if sprint else 14.0)))
	_corpo.rotation.y += angle_difference(_corpo.rotation.y, _rumo) * (1.0 - exp(-dt * 15.0))
	var inclinacao: float = clampf(angle_difference(_corpo.rotation.y, atan2(velocidade.x, velocidade.z)), -0.55, 0.55) if rapidez > 1.0 else 0.0
	var inclinacao_x: float = (-0.13 if velocidade.y > 0.0 else 0.16) if no_ar else -0.17 if sprint else -0.075 if movendo else 0.17 if freando > 0.0 else 0.0
	_pose(_corpo, 0, inclinacao_x, 10.0, dt)
	_pose(_corpo, 2, -inclinacao * 0.3 + sin(_passada) * 0.025 * ritmo, 12.0, dt)
	var respiracao_y: float = sin(_respiracao * 2.1) * 0.022 + sin(_respiracao * 0.91) * 0.015
	var passo_y: float = ciclo * 0.095 * (1.65 if sprint else 1.0) if movendo else 0.0
	var salto_y: float = inicio_salto * -0.055 + (0.015 if no_ar else 0.0)
	_corpo.position.y = _suavizar(_corpo.position.y, _posicao_base.y + pouso * -0.10 + passo_y + respiracao_y + salto_y, 18.0, dt)
	var alongamento: float = (0.09 if velocidade.y > 0.0 else -0.045) if no_ar else 0.0
	var escala_y: float = 1.0 + alongamento + inicio_salto * -0.15 + pouso * -0.18 + sin(_respiracao * 2.2) * 0.008
	var escala_xz: float = 1.0 / sqrt(maxf(0.7, escala_y))
	_corpo.scale = Vector3(_suavizar(_corpo.scale.x, _escala_base.x * escala_xz, 16.0, dt), _suavizar(_corpo.scale.y, _escala_base.y * escala_y, 16.0, dt), _suavizar(_corpo.scale.z, _escala_base.z * escala_xz, 16.0, dt))
	var amplitude: float = (1.18 if sprint else 0.82) * clampf(ritmo * 0.8 + 0.2, 0.3, 1.0) if movendo else 0.0
	for i in 2:
		var perna_x: float = sin(_passada + i * PI) * amplitude if movendo else 0.0
		if no_ar:
			perna_x = (-0.45 if i == 0 else 0.73) if velocidade.y > 0.0 else (0.5 if i == 0 else -0.35)
		if pouso > 0.04:
			perna_x = (-0.65 if i == 0 else 0.65) * pouso
		_pose(_pernas[i], 0, perna_x, 14.0 if no_ar else 22.0, dt)
		_pose(_pernas[i], 2, pouso * (-0.12 if i == 0 else 0.12), 16.0, dt)
		var braco_x: float = -sin(_passada + i * PI) * amplitude * (1.05 if sprint else 0.95) if movendo else sin(_respiracao * 1.3 + i * 2.5) * 0.055
		if no_ar:
			braco_x = -2.1 if velocidade.y > 0.0 else (-1.0 if i == 0 else -2.35)
		if pouso > 0.04:
			braco_x = pouso * (0.9 if i == 0 else -0.9)
		_pose(_bracos[i], 0, braco_x, 20.0, dt)
		var braco_z: float = (-0.36 if i == 0 else 0.36) if no_ar else (-0.1 if i == 0 else 0.1) if sprint else 0.05 * (-1.0 if i == 0 else 1.0)
		_pose(_bracos[i], 2, braco_z, 19.0, dt)
		var lado: float = -1.0 if i == 0 else 1.0
		var arrasto: float = clampf(-velocidade.y * 0.055, -0.7, 0.67) if no_ar else (-0.18 - 0.32 * ritmo + 0.15 * sin(_passada * 0.52 + i * 1.1)) if movendo else sin(_respiracao * 2.2 + i) * 0.07
		_pose(_orelhas[i], 0, arrasto + pouso * 0.34, 11.0, dt)
		_pose(_orelhas[i], 2, -lado * (0.10 + (0.08 if sprint else 0.0)) + sin(_respiracao * 2.3 + i * 2.1) * 0.045, 9.0, dt)
	var escala_cauda: float = 1.08 if sprint else 1.0
	_cauda.scale = Vector3(_suavizar(_cauda.scale.x, escala_cauda, 17.0, dt), _suavizar(_cauda.scale.y, escala_cauda, 17.0, dt), _suavizar(_cauda.scale.z, 1.0, 17.0, dt))
	_pose(_cauda, 1, sin(_passada * 0.65) * 0.19, 15.0, dt)
	_pose(_cauda, 0, -0.16 if sprint else 0.16 if no_ar else 0.0, 12.0, dt)
	_relogio_piscada -= dt
	if _relogio_piscada <= 0.0:
		_piscada_restante = 0.12
		_relogio_piscada = 2.6 + 1.15 * (0.5 + 0.5 * sin(_tempo * 1.3))
	_piscada_restante = maxf(0.0, _piscada_restante - dt)
	for palpebra in _palpebras:
		palpebra.visible = _piscada_restante > 0.0
	_rapidez_anterior = rapidez
	_velocidade_queda = velocidade.y
	_estava_no_chao = no_chao
