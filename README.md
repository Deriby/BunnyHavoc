# Bunny Havoc — controle inicial no Godot

[Baixar o ZIP](Bunnyck_Godot_Controle_Inicial.zip)

Script para anexar ao Jogador (CharacterBody3D) da cena de teste existente.
WASD/setas: andar; K/Ctrl: correr; Espaço: pular. Câmera acompanha X/Z.
Copie a pasta ControleInicial para o projeto e arraste jogador.gd para o
campo Script do Jogador no Inspetor. Instruções completas em LEIA-ME.txt.
O modelo original deve ser filho do Jogador e se chamar Visual.

Parâmetros de movimento extraídos da Fase 1, com cápsula nativa do Godot.
O retorno ao início ao cair é apenas uma utilidade do piso de teste.
Animações de membros, combate, corações, fases e exportações Windows/Web
serão migrados depois. O jogo web e o modelo não foram alterados.

O GLB original e 17 verificações de física/teclas passaram no Godot 4.6.3
headless. O usuário usa 4.7.2 no Windows e conferirá o script nessa versão.
Esta branch contém apenas artefatos, sem publicar código no main.
