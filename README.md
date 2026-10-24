# Bunny Havoc — vídeo integrado / Godot 4.7.2

Projeto completo independente. Extraia em uma pasta NOVA, importe project.godot
no Godot 4.7.2, aguarde a importação e use F5. Não precisa de patches anteriores.
Na janela integrada, selecione Entrada para controlar o jogo.

Filtro e shaders PS1 removidos, incluindo os arquivos do pacote antigo.
Sem névoa nem recorte radial: a paisagem distante permanece visível.
Modelos, texturas, áudio, controles e mecânicas atuais conservados.

Otimização: terreno em 11 faixas em vez de 765 malhas; vegetação agrupada,
HLOD de cenário e personagens distantes, cores compartilhadas, checkpoints e
objetos estáticos unidos, iluminação por vértice no cenário e sombras dinâmicas
desligadas. Malhas completas e LODs nativos já estão calculados no pacote.
Pivôs de animação, física e colisão permanecem independentes do desenho.
Bunnyck, urso e atores do filme mantêm os modelos e hierarquias originais.

Já inicia em Leve, com 240 linhas internas como o jogo no navegador. F3 alterna
Leve (240), Mínimo (180) e Nítido (resolução completa). Interface fica nítida.
F4 mostra/oculta FPS. F2 não ativa nenhum filtro. Céu mantém energia 1,5.

113 verificações: renderização nativa/LOD/F3/F4, atuação, colisões, dano,
caixas e travessia completa com checkpoints, cutscene e save. Todos os 95
arquivos originais de modelos, texturas, áudio e tracks permanecem idênticos.

Comparação justa: a versão anterior foi medida também sem PSX, sem névoa,
sem corte radial, com 240 linhas e sombras desligadas. No início, as chamadas
de desenho caíram de 3.188 para 446; tempo mediano por quadro de 127,6 para
86,6 ms. Medição em Linux llvmpipe (renderização por software); não é promessa
de FPS no Windows nem comparação com o antigo recorte curto e névoa pesada.
Dados completos em Comparacao_Desempenho.json. 6 GB de RAM são um alvo de
uso; desempenho continua dependendo do processador, vídeo integrado e driver.

Inclui a Fase 1 atual completa. Vila/Fase 2 ainda não migradas ao Godot.
