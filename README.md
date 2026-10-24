# Bunny Havoc — cenário unificado / Godot 4.7.2

Projeto completo independente. Extraia em uma pasta NOVA, importe project.godot
no Godot 4.7.2, aguarde a importação e use F5. Não precisa de patches anteriores.
Na janela integrada, selecione Entrada para controlar o jogo.

Árvores, montanhas, chão, pedras, cogumelos, flores e matos são carregados como
cenário pré-agrupado. São 152 blocos lógicos de 32 x 32 m. Terreno e natureza
usam malhas separadas dentro dos blocos para conservar a seleção de LOD e o
culling. Faixas distantes usam HLOD estático pré-calculado. As 2.791 peças e
os 539.452 triângulos originais continuam no nível completo de detalhe.
Textura e materiais são compartilhados; arquivos originais não são alterados.

A floresta de autoria não é instanciada durante o jogo. Ela aparece no editor,
e as cenas originais continuam disponíveis para edição. O bake é gerado por
tools/build_static_world.gd. As rotinas de vento e dobra de plantas ficam
inativas nesta versão: vegetação é estática. Aves, borboletas, poeira e folhas
levantadas por golpes continuam ativas.

NPCs, inimigos, caixas, cenouras, checkpoints, plataformas e atores da cutscene
continuam separados e funcionais. Colisões e o pulinho de dano mantidos.
Sem filtro PS1, névoa ou corte radial. F3 alterna qualidade; F4 mostra FPS.

A fase passou de 12.710 para 4.053 nós em execução. Na cena inicial, chamadas
de desenho de 446 para 341 e alocações estáticas do Godot de cerca de 168 MB
para 136 MB. Isso não representa toda a memória do processo, driver ou GPU.
O tempo mediano por quadro no renderizador por software ficou próximo do
anterior (83,7 para 88,0 ms no trecho parado). Portanto, estes resultados
confirmam uma reorganização e redução de memória/chamadas, NÃO comprovam
fluidez ou solução das travadas no PC do usuário. Dados brutos completos em
Comparacao_Desempenho.json, Linux llvmpipe. Nenhuma garantia de FPS por RAM.

96 verificações passaram no ZIP extraído: estrutura estática/HLOD/materiais,
modos gráficos, atuação, colisões, dano e travessia completa com cutscene/save.
Inclui a Fase 1 atual. Vila/Fase 2 ainda não migradas ao Godot.
