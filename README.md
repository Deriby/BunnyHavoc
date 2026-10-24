# Bunny Havoc — colisões corrigidas / Godot 4.7.2

Projeto completo e independente. Extraia em uma pasta NOVA, importe project.godot
no Godot 4.7.2, aguarde a importação e use F5. Não precisa de patches anteriores.
Na janela integrada, selecione Entrada para controlar o jogo.

Bunnyck agora esbarra nas caixas, inimigos e NPCs. Camadas físicas separadas
corrigem a máscara que antes detectava somente o cenário. NPCs recebem uma
cápsula simples; suas rotinas respeitam obstáculos. Besouros também testam as
colisões durante a patrulha, em vez de sobrescrever a posição.

Golpes continuam quebrando caixas e acertando inimigos. Pisões usam a normal
real do contato e a velocidade de queda antes do resolvedor, preservando dano
e quique. Recuperação dos inimigos continua inofensiva. Caixas destruídas e
inimigos derrotados liberam a passagem. R restaura os corpos e a fase.

Todas as otimizações e o alcance PS1 continuam ativos: F3 alterna Leve (55 m),
Mínimo (40 m) e Original (75 m). F2 alterna o shader. Céu mantém energia 1,5.
Nenhum modelo, áudio, textura ou shader original foi alterado.

Validação do próprio ZIP extraído no Godot 4.7.2: 28 verificações de colisão,
23 de caixas, 21 de inimigos, 12 nativas de modos gráficos/F2/F3 e 6 de travessia
completa, checkpoints, cutscene e progresso salvo. Total de 90 verificações.

Inclui a Fase 1 completa. Vila/Fase 2 ainda não migradas ao Godot.
