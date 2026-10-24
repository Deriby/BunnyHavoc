# Bunny Havoc — pulinho de dano / Godot 4.7.2

Bunnyck agora dá um pequeno salto para trás ao tomar dano não letal, afastando-se
da fonte do golpe. Há uma pose curta de impacto e o recuo respeita as colisões.
Segurar andar, salto ou ataque não cancela a reação de 0,22 s. O controle volta
em seguida. Três corações, imunidade de 1,25 s, mortes e otimizações preservados.
O recuo não consome os sons alternados de pulo. Modelos e áudios intactos.

Para atualizar o último projeto com colisões corrigidas:
- Baixe Bunny_Havoc_Atualizacao_013.zip (33 KB).
- Feche o Godot, extraia NA PASTA que contém project.godot e substitua os arquivos.
- Reabra e use F5. Este patch exige a versão Bunny_Havoc_Godot_4_7_Colisoes.

Alternativamente, Bunny_Havoc_Godot_4_7_Reacao_Dano.zip é o projeto completo:
extraia em pasta nova e importe project.godot no Godot 4.7.2. F5 para jogar.
Não precisa aplicar o patch nesse projeto completo.

Validação do ZIP completo: 15 verificações específicas da reação de dano,
28 de colisões e 6 da travessia completa, checkpoints, cutscene e save.
O patch aplicado à versão Colisoes gera exatamente os mesmos 255 arquivos do
projeto completo testado, além das duas instruções próprias do patch.

F2 alterna PSX; F3 alterna Leve/Mínimo/Original. Alcance PS1 e céu 1,5 mantidos.
Inclui a Fase 1 atual. Vila/Fase 2 ainda não migradas ao Godot.
