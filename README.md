# Bunny Havoc — animações detalhadas da emboscada / Godot 4.7.2

ATUALIZAÇÃO PEQUENA: Bunny_Havoc_Atualizacao_014.zip (71 KB).
Requer o projeto Bunny_Havoc_Godot_4_7_Arena_Bosque, entregue anteriormente.
Feche o Godot, extraia o conteúdo na pasta que contém project.godot,
aceite substituir e reabra. Não há pasta externa dentro deste ZIP.

PROJETO COMPLETO: Bunny_Havoc_Godot_4_7_Arena_Animada.zip (28,2 MB).
Alternativa independente: extraia em uma pasta NOVA, importe project.godot,
aguarde a importação e use F5. Não precisa de patches anteriores.

O vigia vira a cabeça/corpo, toca o sino em dois tempos e aponta a ordem.
O sino tem pivô e balanço amortecido. A câmera mostra o alarme, acompanha
o fechamento do portão e abre para mostrar a arena.

Portões de duas folhas: dobradiças, trava, aceleração, batida e vibração.
Abrem para fora do espaço de combate; colisão só é liberada perto do fim.
Pular a cena, morrer e reiniciar cancelam as animações com estados corretos.
Uma vitória já conquistada permanece válida mesmo morrendo durante a abertura.

Reforços: atraso individual, antecipação, salto com pernas recolhidas,
cauda acompanhando, pouso amortecido e retorno à guarda antes de atacar.
O vigia já estava no chão e entra no combate com um gesto de comando.
Poeira/folhas: pool fixo de 48 elementos e uma MultiMesh. Quatro vozes
reutilizadas; sons existentes. Efeitos desligam quando acabam.
As ondas continuam 3 + 3 + 4, com dois atacantes preparando/atacando por vez.
Modelos e materiais dos personagens, cenário estático e arquivos de áudio
não foram alterados. Geometria dos portões e pivô do sino são montados por script.

106 verificações passaram: 80 no ZIP completo e 26 aplicando a atualização
sobre o projeto anterior. Inclui entrada/pouso, fechamento, pular cena,
R, morte/repetição, vitória, colisões e travessia por teclado até o filme/save.

Prévia real capturada no Godot, com câmera e modo Leve do jogo:
Previa_Emboscada.gif (reduzida, em loop) e Emboscada_Animada.mp4 (sem áudio).
São imagens da introdução e da primeira onda, não uma concept art.
A entrega acrescenta animações e não afirma resolver as travadas de hardware.
