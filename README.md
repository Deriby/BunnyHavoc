# Bunny Havoc — primeiro trecho do Bosque Verde no Godot

Baixe **Bunny_Havoc_Godot_Bosque.zip** e extraia tudo em uma pasta nova.
No gerenciador do Godot, escolha Importar e selecione `project.godot`.
Aguarde os recursos serem importados e pressione F5. No jogo embutido, ative Entrada.

O projeto abre o início da Fase 1, com cenário/objetos extraídos dos construtores
originais: duas caixas, oito cenouras, vão pequeno, primeira plataforma móvel,
espinhos e estátua-checkpoint. O checkpoint é ativado chegando ao outro lado
no chão e mantém a coleta entre vidas da tentativa. O trecho termina logo depois.
O urso da Fase 2 foi colocado como encontro de teste, com todos os refinamentos
anteriores. A arena anterior está em `ArenaCombate.tscn` e pode ser aberta com F6.

WASD/setas: mover; K/Ctrl: correr; Espaço: pular; J/Shift repetidos: combo.
R reinicia o trecho inteiro. Corrida ajuda a atravessar os vãos.
Todos os modelos, scripts e sons já migrados estão inclusos e conectados.
A música original do bosque é externa e toca em loop.

É a pasta completa do projeto Godot desta etapa. Não é a Fase 1 inteira:
restante das fases, NPCs/inimigos originais da Fase 1, cutscenes, vila,
campanha e saves entre sessões ainda estão na versão web preservada.
Não é uma exportação Windows/HTML5; é o projeto editável para Godot.

20 verificações do trecho e 32 do combate anterior passaram no Godot 4.6.3 Linux.
O ZIP foi extraído em diretório novo, importado, iniciado e passou nos 20 casos.
Cinco verificações com renderização real conferiram cenário e checkpoint.
O usuário utiliza 4.7.2 no Windows; a conferência nessa versão será feita por ele.
O driver Dummy nos testes de áudio não substitui a conferência auditiva.

A prévia JPG usa capturas do próprio Godot. O ZIP inclui manifesto SHA-256.
Esta branch contém somente artefatos de entrega e preserva o main.
