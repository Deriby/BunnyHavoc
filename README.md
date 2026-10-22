# Bunny Havoc — combo original no Godot

[Baixar atualização completa](Bunnyck_Godot_Combo.zip)

Giro → soco → soco final, adaptados do jogo atual, com punho curto,
fitas, poses, alcance moderado, sons WAV externos e passos curtos que
respeitam piso contínuo e obstáculos. Modelo original preservado.

## Atualizar a cena que já funciona

1. Pare o jogo com F8 e extraia o ZIP.
2. No Godot, abra a localização do jogador.gd que você já usa no Explorador.
3. Copie TODO o conteúdo da pasta ControleInicial extraída para essa pasta,
   substituindo os arquivos antigos. Mantenha os quatro .gd juntos e audio/
   ao lado deles. O script continua anexado somente ao Jogador.
4. Volte ao Godot, aguarde importar os WAVs e recarregar os scripts, salve e F6.

WASD/setas movem, K/Ctrl corre e Espaço pula. J ou Shift ataca; novos
apertos encadeiam giro, soco e soco final. Segurar não encadeia.

Nesta cena ainda não há inimigos, caixas nem HUD de corações. A interface
preserva dano 1/1/2, um acerto por golpe e finalizador para integração futura.
Dano e arremesso em inimigos dependem da próxima etapa.

47 verificações nativas e comparações com 980 poses de locomoção e 390
quadros de combo passaram no Godot 4.6.3 headless. O usuário usa 4.7.2 e
conferirá visual e áudio. WAVs renderizam os parâmetros dos osciladores
originais, podendo soar ligeiramente diferentes de WebAudio.

Pacote anterior preservado na branch entrega-godot-animacoes. O jogo web,
os backups e o GLB não foram alterados. Exportações Windows/Web pendentes.
Branch somente de artefatos, sem alterações publicadas no main.
