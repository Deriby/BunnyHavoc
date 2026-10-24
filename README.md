# Bunny Havoc — terra e arena do bosque / Godot 4.7.2

Projeto completo independente. Extraia em pasta NOVA e importe project.godot
no Godot 4.7.2. Aguarde a importação e use F5. Na janela integrada, use Entrada.
Não precisa aplicar patches anteriores. F3: qualidade; F4: FPS.

A trilha agora é de terra texturizada com transição para a grama. Depois do
segundo checkpoint, junto da Luna, há uma clareira circular de cerca de 22 m
úteis. Um vigia da patrulha de Bibibunn bate o alarme para impedir Bunnyck de
alcançar Bunnyldu. Enter pula a cena de 5,8 segundos.

Derrote dez lagartos humanoides em ondas de 3, 3 e 4. Os reforços saltam das
laterais. Dois inimigos podem preparar/realizar ataques ao mesmo tempo.
O combo, o recuo, as colisões e as recompensas continuam ativos. Patrulheiros
só ferem durante o ataque anunciado. A câmera abre para mostrar a arena.
A barricada abre depois da décima derrota e o trilho de câmera retorna.

Morte permite nova tentativa sem repetir a cena já vista. Recompensas de
inimigos já derrotados nessa arena não são pagas novamente durante tentativas.
Uma arena vencida permanece aberta depois de mortes posteriores. R reinicia.
O vão curto original foi coberto para formar o piso, mas o salto grande
seguinte foi preservado. Luna fica na lateral e o besouro antes da clareira.

Sistema separado e configurável em Sistemas/Arenas/arena_ondas.gd.
Instruções em Fase1/Arena/LEIA-ME.md. Inclui o gerador de cenário estático
Ferramentas/gerar_cenario.gd; não é preciso executar o gerador para jogar.

171 verificações passaram no ZIP completo extraído (incluindo 26 verificações
com renderização nativa): ondas, cena, morte/repetição, portões, controles,
colisões, dano, caixas, atuação, LOD/HLOD e travessia por teclado até o fim
com dez inimigos derrotados e a cutscene final/progresso salvo. Os 95 arquivos
originais de modelos, áudio, imagens e dados permanecem idênticos.

Esta entrega acrescenta a arena à Fase 1 atual. As próximas fases precisam
de encontros próprios; Vila/Fase 2 ainda não migradas para Godot. Continua
sem filtro PS1, névoa ou corte radial. Não é uma promessa de corrigir as
travadas no PC do usuário, nem uma garantia de desempenho por RAM.
