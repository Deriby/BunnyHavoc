# Bunny Havoc — alcance de desenho PS1 / Godot 4.7.2

Projeto completo independente. Extraia em uma pasta NOVA, importe project.godot
no Godot 4.7.2, aguarde a importação e use F5. Não precisa de patches anteriores.
Na janela integrada, selecione Entrada para controlar o jogo.

O desenho agora acompanha a área em volta do Bunnyck, incluindo terreno,
vegetação, objetos, inimigos e fauna. Setores distantes ficam fora das camadas
de renderização. Colisões, IA, gatilhos e visibilidade lógica não são pausados.
A câmera também tem far curto e névoa esconde o limite, no estilo PS1.

F3 alterna:
- Leve: raio de 55 m e escala 3D 0,5 (modo inicial).
- Mínimo: raio de 40 m e escala 3D 1/3.
- Original: raio de 75 m e resolução 3D completa.

Terreno e vegetação usam setores de 16 m. Setores que cruzam a borda são
mantidos para evitar fendas. Todos os 117.630 triângulos do terreno e as
2.791 peças de vegetação foram preservados. Arquivos de modelos, áudio,
texturas, tracks, shader enviado e controles continuam originais.

Durante a cutscene, o centro acompanha a câmera com raio de 90 m; os atores
do filme continuam sob controle da coreografia original. O céu mantém energia
1,5 e seu fundo inferior acompanha a névoa para esconder o recorte.
F2 continua alternando o PSX; névoa e alcance funcionam também sem o shader.

Testado diretamente do ZIP extraído: 19 verificações nativas do raio/terreno,
12 de F3/F2/colisão, 6 de travessia completa/cutscene/save, 16 nativas de PSX,
mais 6 verificações/capturas de modos, lotes e HUD.

Medição com o jogo parado e todos os sistemas ativos: mediana de 127 ms para
53 ms por quadro no ambiente Linux llvmpipe. Dados brutos em
Comparacao_Desempenho.json; não é uma promessa de FPS no Windows do usuário.

Inclui a Fase 1 completa. Vila/Fase 2 ainda não migradas ao Godot.
