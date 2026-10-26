# Bunny Havoc — visibilidade e cenário 3D / atualização 021

Patch de 191 KB para a atualização 020, Godot 4.7.2 Compatibility.
Feche o Godot, guarde uma cópia da pasta e extraia o ZIP na mesma pasta de
project.godot, substituindo os arquivos. Reabra e F5 para jogar.
Este patch requer a 020 e não contém o projeto independente.

Os espinhos, plataformas e itens recebem proteção contra a simplificação agressiva
da decoração. Os dois conjuntos de espinhos foram verificados por imagens a
20, 12, 5 e 2 metros de aproximação: o perfil Mínimo retém pelo menos 97% da
silhueta renderizada sem simplificação. Cenouras coletáveis não são descartadas
por ficarem pequenas. O terreno próximo mantém um limite de erro mais rigoroso.

A vegetação conserva suas peças originais até 20 m no Mínimo / 28 m no Leve,
e malhas nativas dos modelos aprovados até 40 m / 56 m. Depois mantém as imagens
de fundo existentes. Árvores não viram cartões no primeiro plano. Proxies 3D
substituem cartões de NPCs/inimigos distantes; animações próximas permanecem.
Um lote de sombras suaves assenta atores e caixas no piso, sem mapas de sombras.
Não desenha sombra do jogador sobre um buraco sem apoio.

Mantém a câmera e paleta da 020, os personagens aprovados, controles, colisões,
áudios, fases, combate, cutscene e progressão. Não adiciona filtro PS1 ou neblina.
F3 alterna detalhes; F7 alterna resolução; F4 mostra FPS.

123 verificações passaram no projeto extraído e no patch sobre uma 020 limpa.
Incluem espinhos, vegetação, câmera, travessia por teclado, colisões, arena,
cutscene e carregamento por trechos. As prévias são capturas reais, sem edição.
As imagens com pose estável verificam visibilidade; não são medidas de FPS.

CUSTO VISUAL: há mais geometria 3D visível. Nas amostras curtas por software
llvmpipe a 360p: 39.1 FPS parado, 31.1 andando e 28.7 em combate. A 020 foi mais
rápida nesse ambiente. Não garante 30 ou 60 FPS e não mede o PC do usuário.
O limite intermediário de 80 m foi descartado por piorar mais o combate.
Verificacoes.json contém os resultados e hashes dos arquivos testados.
