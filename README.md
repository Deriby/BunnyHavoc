# Bunny Havoc — sons alternados de pulo

[Baixar componente pronto](Bunnyck_Godot_Pulos.zip)

Usa os três MP3 enviados, intactos: Jump1 → Jump2 → Jump3 → Jump1.
Toca uma vez no começo de cada salto real, inclusive correndo. Segurar
Espaço, apertar no ar ou apenas cair de uma borda não dispara outro som.

1. Pare com F8, extraia o ZIP e copie PulosBunnyck para a pasta do projeto,
   junto de project.godot.
2. No Godot, espere importar e arraste res://PulosBunnyck/Pulos.tscn
   diretamente sobre o nome Jogador, na árvore da cena.
3. Pulos deve ficar ao lado de Visual, CollisionShape3D e Passos.
4. Salve com Ctrl+S e teste com F6 → Entrada.

Volume no nó Pulos, campo Volume dB: inicial -6; 0 aumenta, -12 diminui.
As três Amostras já estão preenchidas. Instale apenas uma instância.
Não altera controle, modelo, física, combo nem o componente de passos.

14 verificações passaram no Godot 4.6.3 headless, incluindo sequência,
saltos reais, tecla segurada, tentativa no ar, corrida, tolerância de borda
e integração com passos/combate. Conferência auditiva no 4.7.2 do usuário
pendente. Branch somente de artefatos; não altera main.
