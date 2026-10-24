# Bunny Havoc — projeto completo otimizado / Godot 4.7.2

Inclui todas as melhorias até a atualização 012, modelos, texturas, áudio,
Fase 1 completa e cutscene. Projeto independente: não requer nenhum patch.
Vila e Fase 2 ainda não migradas ao Godot.

1. Feche o Godot e extraia o ZIP em uma pasta NOVA.
2. No Godot 4.7.2, use Importar e selecione project.godot na pasta extraída.
3. Aguarde a importação, aperte F5 e selecione Entrada na janela integrada.

Vegetação em setores, vento com busca espacial, menos atualizações de
animação distante e de caixas paradas. PSX atualiza cores opacas por evento
e deixa de desenhar sombras que seus shaders não exibem. A configuração
das luzes permanece original; F2 restaura os materiais e as sombras.

2.791 peças de vegetação mantidas; modelos, texturas, áudios, cenas, colisores,
trilhas e shader enviado preservados. As regras do combate não mudaram.

Testado do ZIP extraído: 20 verificações da otimização com renderização nativa,
18 do cenário/NPCs, 23 das caixas e 6 da travessia completa com combate,
checkpoints, morte, final, cutscene e save. Imagens congeladas idênticas ao
alternar apenas as sombras dispensáveis. F2 e cores dinâmicas verificados.

Chamadas de desenho nos três pontos de comparação: redução de 30.6%, 30.5%, 42.7%.
A atualização dos materiais ficou mais leve; o ganho depende da máquina.
Comparação no Godot nativo, Compatibility/llvmpipe Linux; não é promessa
sobre FPS no Windows. Dados completos em Comparacao_Desempenho.json.
