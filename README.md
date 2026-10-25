# Bunny Havoc — cenário distante mais leve / Godot 4.7.2

ATUALIZAÇÃO 015 (~294 KB): requer Bunny_Havoc_Godot_4_7_Arena_Animada,
ou o projeto Arena_Bosque com a atualização 014 aplicada.
Feche o Godot e extraia o conteúdo na pasta que contém project.godot,
substituindo os arquivos. Reabra e use F5. Não precisa colar código.

PROJETO COMPLETO (~28,4 MB): alternativa independente. Extraia em pasta NOVA,
importe project.godot no Godot 4.7.2, aguarde a importação e F5.

O maior peso medido estava na vegetação desenhada, e não na resolução de tela.
O modo Leve mantém geometria detalhada próxima e usa representações preparadas
dos modelos originais para as faixas distantes de vegetação. São 13 tipos,
1756 plantas em 98 grupos. Sem névoa, corte radial ou filtro PS1.
A apresentação dos primeiros 40 m recebe proteção adicional de detalhe.
As representações são imagens em planos voltados à câmera: preservam silhueta
e cores a distância, mas têm menos profundidade/paralaxe que o modelo 3D.
Em Nítido, toda a vegetação distante volta ao caminho de renderização original.

F3: Leve 240 linhas/LOD ajustado, Mínimo 180 linhas/LOD mais forte, Nítido
resolução completa/vegetação 3D original. F4: FPS e nome da placa de vídeo.
As sondagens dos inimigos passam de passos de 4 cm para 16 cm, mantendo
varredura do volume contra obstáculos e checagem de chão em cada trecho.
Testes de bordas, colisões, inimigos e travessia completa passaram.
Nenhuma malha, textura ou arquivo de áudio original foi sobrescrito.

MEDIÇÕES REAIS, Linux llvmpipe (software), mesma cena inicial, jogo ativo:
- Antes: 393335 triângulos; mediana 88,403 ms (~11,3 FPS).
- Leve: 104109 triângulos; medianas 39,713 e 34,571 ms (~25,2 a 28,9 FPS).
- Mínimo: 88343 triângulos; mediana 29,866 ms (~33,5 FPS).
São amostras curtas, 20 quadros após aquecimento, sem execução concorrente
de benchmarks. Não equivalem ao desempenho na máquina do usuário nem a uma
medição de estabilidade longa. NÃO foram alcançados 60 FPS constantes aqui.
Algumas vistas pausadas chegaram a 60, mas não são usadas como FPS jogável.
O alvo continua 60 e precisa ser medido no computador de destino.

137 verificações passaram no ZIP completo extraído e no patch sobre sua base:
qualidade/cobertura próxima e distante, renderização nativa, arena, animações,
colisões, IA e travessia por teclado até a cutscene e progresso salvo.
A Vila/Fase 2 ainda não foram migradas ao Godot; entrega da Fase 1 atual.

Ferramentas/gerar_impostores.gd gera as representações fora do jogo usando
Compatibility com renderização ativa (sem --headless). Não execute para jogar.
