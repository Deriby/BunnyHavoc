# Bunny Havoc — imagem mais nítida / atualização 019

Patch de 62 KB; requer a versão 018 / Fase_Por_Trechos.
Feche o Godot e extraia na pasta de project.godot, substituindo os arquivos.
F5 inicia. A imagem agora começa em 360p, em vez de 168p.

F7 alterna 168p → 240p → 360p → 540p → nativa → 168p.
F4 mostra FPS e resolução. A escolha fica salva para a próxima execução.
Use a maior resolução que conseguir manter aproximadamente 30 FPS no seu PC.
F3 altera apenas os detalhes do cenário; não é necessário aumentar esses
detalhes para ter uma imagem mais nítida. O início continua no modo Mínimo.
F8 não foi usado porque é o atalho do editor para parar o jogo.

Apenas Sistemas/Visual/desempenho.gd foi alterado. Modelos, geometria, áudio,
controles de movimento, combo, fases, câmera, arena e cutscene não mudaram.
O progresso não é alterado; a preferência usa user://imagem_019.cfg.

Sete verificações nativas passaram, incluindo teclado, persistência e
independência entre resolução e detalhes. Cinco resoluções foram medidas
em uma caminhada ativa curta, depois de aquecer o mesmo percurso.
Os resultados por software em Medicoes.json não garantem os mesmos FPS
no PC do usuário. Resolução maior pode reduzir FPS; ajuste com F7.
As imagens anexas são capturas diretas do jogo em 168p e 360p, sem edição.
