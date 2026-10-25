# Bunny Havoc — piloto de trechos / atualização 017

Patch de 1,13 MB para Godot 4.7.2 Compatibility.
Base necessária: Bunny_Havoc_Godot_4_7_Render_Leve / atualização 015.
A atualização 016 não é necessária: os lotes preparados estão incluídos.

1. Faça uma cópia da pasta atual e feche o Godot.
2. Extraia Bunny_Havoc_Atualizacao_017.zip na pasta que contém project.godot.
3. Substitua os arquivos e reabra. F5 inicia; F4 mostra FPS e GPU; F3 troca qualidade.

Piloto somente no início do bosque, até Z -64. Setores de 32 m suspendem
callbacks de NPCs e inimigos em patrulha distantes. Foram observadas 26 rotinas
suspensas no início. Há antecipação e margem entre dormir e acordar.
Nós, colisões, poses e estado são mantidos. Não suspende diálogo, ataque,
dano ou morte. Ao sair do piloto ou entrar no cinema, restaura o processamento.
Não altera câmera, GLBs, terreno, controles, áudio, energia do céu ou neblina.
O fundo continua visível. Isto não implementa streaming de memória ou toda a
arquitetura de Crash; é a primeira etapa de ativação de simulação por trechos.

Inclui os lotes preparados: vegetação próxima instanciada, imagens dos modelos
à distância, lotes animados de Bunnyck/urso e cenouras. Inicia no perfil Mínimo,
com 168 linhas internas; a interface mantém sua resolução. Nítido restaura a
vegetação 3D anterior. Imagens distantes têm menos paralaxe.

84 verificações passaram: travessia completa por teclado, colisões, recuo,
reativação, preservação de estado, renderização e patch aplicado à base 015.
Arquivos originais de modelos, áudio, malhas de terreno e cena principal
foram comparados com a base. O HTML original não foi modificado.

Os 60 FPS constantes ainda NÃO foram alcançados. Medições curtas por software
mostraram redução do trabalho de física no trecho, mas FPS mistos entre cenários.
Comparacao.json isola o piloto usando a mesma base de lotes nas duas medições;
não é uma comparação direta com a entrega 015 nem uma garantia para outro PC.
A Fase 1 está no Godot; Vila e Fase 2 continuam na versão web.
