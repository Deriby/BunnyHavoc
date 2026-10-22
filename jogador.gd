extends CharacterBody3D
## Primeira etapa de movimento: parâmetros extraídos da Fase 1 de Bunny Havoc.
## Combate, animações de membros, saúde e regras das fases serão migrados depois.

@export var velocidade_andar: float = 6.4
@export var velocidade_correr: float = 10.3
@export var gravidade: float = 24.0
@export var impulso_salto: float = 10.1
@export var impulso_salto_correndo: float = 12.8
@export var acompanhar_camera: bool = true
@export var voltar_ao_cair: bool = true

const ACELERACAO_CHAO: float = 10.0
const ACELERACAO_AR: float = 5.2
const TOLERANCIA_BORDA: float = 0.10
const LIMIAR_SALTO_CORRENDO: float = 7.6

var _visual: Node3D
var _camera: Camera3D
var _inicio: Vector3
var _camera_inicio: Vector3
var _tolerancia_restante: float = 0.0
var _salto_pressionado: bool = false
var _direcao_visual: float = 0.0

func _ready() -> void:
	_visual = get_node_or_null("Visual") as Node3D
	_camera = get_viewport().get_camera_3d()
	_inicio = global_position
	if _camera != null:
		_camera_inicio = _camera.global_position
	if _visual != null:
		_direcao_visual = _visual.rotation.y

func _physics_process(delta: float) -> void:
	var eixo: Vector2 = _ler_direcao()
	var correndo: bool = (
		Input.is_physical_key_pressed(KEY_K)
		or Input.is_physical_key_pressed(KEY_CTRL)
	) and eixo.length() > 0.1
	var velocidade_alvo: float = velocidade_correr if correndo else velocidade_andar
	var taxa: float = ACELERACAO_CHAO if is_on_floor() else ACELERACAO_AR
	var fator: float = minf(1.0, delta * taxa)
	velocity.x = lerpf(velocity.x, eixo.x * velocidade_alvo, fator)
	velocity.z = lerpf(velocity.z, eixo.y * velocidade_alvo, fator)

	if is_on_floor():
		_tolerancia_restante = TOLERANCIA_BORDA
	else:
		_tolerancia_restante = maxf(0.0, _tolerancia_restante - delta)

	var espaco: bool = Input.is_physical_key_pressed(KEY_SPACE)
	if not espaco:
		_salto_pressionado = false
	if espaco and not _salto_pressionado and _tolerancia_restante > 0.0:
		var rapidez: float = Vector2(velocity.x, velocity.z).length()
		velocity.y = impulso_salto_correndo if rapidez > LIMIAR_SALTO_CORRENDO else impulso_salto
		_tolerancia_restante = 0.0
		_salto_pressionado = true

	velocity.y -= gravidade * delta
	move_and_slide()
	_atualizar_direcao(delta, correndo)

	# Recuperação desta plataforma de teste; ainda não é a regra de morte/vidas.
	if voltar_ao_cair and global_position.y < _inicio.y - 12.0:
		voltar_ao_inicio()
	_atualizar_camera()

func _ler_direcao() -> Vector2:
	var direita: bool = Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT)
	var esquerda: bool = Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)
	var baixo: bool = Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN)
	var cima: bool = Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP)
	var eixo: Vector2 = Vector2(float(direita) - float(esquerda), float(baixo) - float(cima))
	return eixo.normalized() if eixo.length_squared() > 1.0 else eixo

func _atualizar_direcao(delta: float, correndo: bool) -> void:
	if _visual == null:
		return
	var rapidez: float = Vector2(velocity.x, velocity.z).length()
	if rapidez > 1.1:
		var alvo: float = atan2(velocity.x, velocity.z)
		var taxa_giro: float = 11.0 if correndo else 14.0
		_direcao_visual = lerp_angle(_direcao_visual, alvo, 1.0 - exp(-delta * taxa_giro))
	_visual.rotation.y = lerp_angle(_visual.rotation.y, _direcao_visual, 1.0 - exp(-delta * 15.0))

func _atualizar_camera() -> void:
	if acompanhar_camera and is_instance_valid(_camera):
		# Mantém altura/rotação que o usuário configurou; acompanha só X/Z.
		var deslocamento: Vector3 = global_position - _inicio
		_camera.global_position = _camera_inicio + Vector3(deslocamento.x, 0.0, deslocamento.z)

func voltar_ao_inicio() -> void:
	global_position = _inicio
	velocity = Vector3.ZERO
	_tolerancia_restante = 0.0
	_salto_pressionado = Input.is_physical_key_pressed(KEY_SPACE)
	_atualizar_camera()
