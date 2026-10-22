# Bunny Havoc — animações originais no Godot

[Baixar o ZIP](Bunnyck_Godot_Animacoes.zip)

Adaptação das animações de locomoção da Fase 1: andar, correr, frear,
saltar, cair e aterrissar, com orelhas, cauda, respiração e piscadas.
Modelo, escala, física e controles preservados. Sem giro/socos nesta etapa.

## Atualizar o projeto que já está funcionando

1. Pare o jogo com F8 e extraia o ZIP.
2. No Godot, clique com o botão direito no jogador.gd que você já usa e
   abra sua localização no gerenciador de arquivos.
3. Copie jogador.gd e bunnyck_animacao.gd novos para essa mesma pasta,
   substituindo jogador.gd. Os dois arquivos precisam ficar juntos.
4. Volte ao Godot, aceite recarregar os arquivos se solicitado, salve e F6.

O script já está anexado ao Jogador. Esta atualização não exige anexar
scripts a outros nós. A árvore, cena e GLB que você montou continuam iguais.
WASD/setas movem, K/Ctrl corre e Espaço pula. Instruções em LEIA-ME.txt.

22 testes nativos de movimento/física/animação passaram no Godot 4.6.3
headless. Outros 980 quadros foram comparados com a execução literal do
animator original Three.js; erro máximo nas matrizes menor que 0,000001.
O usuário usa Godot 4.7.2 e ainda conferirá visualmente esta atualização.
Sem validação de exportações Windows/Web nesta etapa.

O pacote anterior permanece em entrega-godot-controle-inicial. O jogo web,
o modelo GLB e os backups não foram alterados. Branch somente de artefatos;
não publica código no main.
