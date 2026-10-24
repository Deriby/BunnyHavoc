# Bunny Havoc — projeto completo Godot 4.7.2 / modo leve

Projeto completo e independente: extraia em pasta NOVA, importe project.godot
no Godot 4.7.2, aguarde a importação e aperte F5. Na janela integrada, use Entrada.
Não precisa de nenhum patch anterior.

Já inicia no modo Leve. F3 alterna:
- Leve: resolução interna 3D 576x324, saída 1152x648.
- Mínimo: resolução interna 3D 384x216, saída 1152x648.
- Original: resolução 3D completa 1152x648.

HUD e diálogos continuam na resolução normal. A imagem 3D nos modos Leve e
Mínimo usa resolução menor, com filtro nearest e a grade PSX ajustada para
conservar o estilo. F2 continua alternando o shader, independentemente de F3.
Os valores acima são para a janela padrão; acompanham o tamanho da janela.

Peças estáticas dentro de membros dos NPCs/besouros/lagartos usam lotes e
materiais equivalentes compartilhados. 504 peças viraram 158 lotes, sem
remover triângulos ou mudar pivôs/animar personagens como blocos únicos.
Geometrias de objetos/personagens além de 145 m não são desenhadas; a névoa
já está completa a 120 m. Comportamento e colisões continuam ativos.

Modelos, texturas, áudio, shader enviado, controles e regras preservados.
Bunnyck e os atores da cutscene não foram agrupados. Inclui a Fase 1 completa;
Vila e Fase 2 ainda não migradas ao Godot.

Testado do ZIP extraído: qualidade/F3/F2, combate, mortes, travessia completa,
cutscene/save e capturas nativas. Agrupar as peças preservou a imagem dos
personagens no teste congelado; HUD permaneceu igual ao reduzir o 3D.
No enquadramento testado, chamadas de desenho: 1.851 -> 795 (-57%).
Tempos de quadro estão em Comparacao_Desempenho.json. Medição em Linux
llvmpipe; não representa FPS garantido no Windows do usuário.
