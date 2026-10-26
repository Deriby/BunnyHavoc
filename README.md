# Bunny Havoc — câmera e paleta do HTML / atualização 020

Patch cumulativo de 2,61 MB para a versão 018 OU 019, Godot 4.7.2 Compatibility.
Feche o Godot, faça uma cópia da pasta atual e extraia o ZIP na pasta que contém
project.godot, substituindo os arquivos. Reabra e F5 para jogar.

A câmera normal fica mais elevada e inclinada para o caminho, com Bunnyck na
parte inferior do quadro. O horizonte deixa de dominar a imagem. A antecipação
dos saltos continua e a chegada do primeiro vão foi verificada no enquadramento.
A câmera da arena e a cutscene não foram alteradas.

O chão recupera a paleta da Fase 1 em src/fase_1_logica_3d.js: verdes mais vivos,
trilha clara, pintura suave e transição para a grama. A textura granulada foi
retirada. As cores são preparadas nos vértices antes do jogo, sem ruído por pixel,
shader adicional, novos objetos ou efeitos. As superfícies compartilham material.
As faces e posições do terreno são preservadas. Originais e GLBs não foram gravados.
Os recursos novos estão em Recursos/Terreno020; as fontes antigas permanecem.

Inclui a melhoria de resolução da 019: começa em 360p se não houver preferência.
F7 alterna resolução e salva a escolha; F4 mostra FPS; F3 troca detalhes.
Não adiciona filtro PS1, neblina, mudança de controles, combate ou progresso.

97 verificações passaram, incluindo câmera, aterrissagem, terreno, ida/volta,
travessia completa por teclado, colisões, arena e cutscene. O patch foi importado
e executado a partir de uma extração limpa da 018; sobreposição com a 019 também
foi verificada. As imagens são capturas diretas do enquadramento, sem edição.
As capturas têm pose estável e não são usadas como medidas de FPS.

Verificacoes.json também registra medições separadas de jogo ATIVO a 360p
em repouso, caminhada e combate. São amostras curtas por software (llvmpipe),
não uma garantia de FPS no PC do usuário. Não foi aumentada a quantidade de faces.
