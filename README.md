# Bunny Havoc — Fase 1 por trechos / Godot 4.7.2

Atualização 018: 2,03 MB. REQUER atualização 017 / Trechos_Piloto.
Feche o Godot, faça uma cópia da pasta e extraia o patch na pasta que contém
project.godot. Confirme as substituições e reabra. F5 inicia; F4 mostra FPS.
Se não tiver a base 017, use o projeto completo em pasta NOVA.

Mudança na Fase 1 inteira:
- Oito trechos estáticos de 64 m, carregados antecipadamente em tarefas de fundo.
- Uma faixa pronta é instanciada por quadro; detalhes distantes são liberados.
- O fundo simplificado permanece até o trecho detalhado estar disponível.
- Os 152 lotes de terreno foram agrupados em 47, preservando faces e materiais.
- Índice espacial seleciona plantas próximas; no início consulta 178 de 1819.
- NPCs e inimigos em patrulha suspendem rotinas distantes em todo o percurso.
- Diálogos, ataques, dano e morte não são suspensos. O cinema usa sua câmera.

As colisões e os nós de caixas, cenouras, plataformas e checkpoints permanecem
independentes. Revisitar não recria objetos coletados ou quebrados. A trajetória
e o tempo das plataformas foram mantidos. Os GLBs, áudio, fontes do terreno,
controles, combate, arena e cutscene não foram reescritos. Sem fog ou filtro PS1.
Nítido carrega a vegetação 3D anterior sob demanda; os outros perfis usam os
lotes e imagens distantes existentes. Resolução e céu mantêm a configuração 017.

135 verificações passaram: terreno recompilado, ida/volta/teleporte, coleta e
caixas persistentes, travessia completa, colisões, recuo, arena, cinema,
renderização nativa e patch aplicado sobre uma extração limpa da base 017.
117356 assinaturas de faces e materiais conferem com a fonte original.

A arquitetura foi implementada, mas os 60 FPS CONSTANTES ainda NÃO foram
alcançados. A comparação isolada não estabeleceu ganho relevante de FPS.
As chamadas de desenho caíram (132 para 123 parado, 150 para 125 em combate),
mas os picos de quadro continuam. Os números usam llvmpipe por software;
não representam garantia de desempenho no PC do usuário. Veja Comparacao.json.
Uma tentativa extra de preparação de materiais foi medida e desfeita.

A cena integral anterior continua em Fase1/Estatico/CenarioEstatico.tscn.
Ferramentas/gerar_trechos.gd recompila as faixas; não precisa rodar para jogar.
Em exportações, inclua todos os recursos ou explicitamente a pasta Trechos;
inclua também *.json e *.gz. A Vila e a Fase 2 ainda permanecem na versão web.
