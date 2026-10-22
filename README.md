# Bunny Havoc V45 — build modular (etapa 7)

[Baixar o pacote completo](Bunny_Havoc_V45_Modular.zip)

Carregamento, prontidão, timeout/retry, trocas e mensagens das cenas convertidos
para um coordenador TypeScript, preservando textos, controles, confirmações,
temporizadores e compatibilidade da V45. As cenas continuam isoladas em iframes.
Three.js r128, músicas, scripts e estilos estão incluídos localmente.
O build, os tipos e as 17 suítes passaram. O ZIP foi testado no navegador por HTTP.

Extraia o ZIP inteiro, mantendo assets, scenes, runtime e vendor. Com Python 3,
abra um terminal na pasta extraída e execute:

```
python -m http.server 8765 --bind 127.0.0.1
```

Abra http://127.0.0.1:8765/ no navegador. O nome antigo
Bunny_Havoc_V45_Vila_JOGAR.html também abre o jogo. É possível publicar a pasta
em qualquer servidor web estático, inclusive em subdiretório.
O pacote não precisa do CDN do Three.js. Saves pertencem à origem usada para jogar.

Os backups e entregas anteriores permanecem preservados. Não houve atualização
do motor, dos modelos ou das mecânicas nesta etapa. A composição do launcher e os resultados, a lógica das fases e os efeitos
sonoros continuam em JavaScript para conversão gradual nas próximas etapas.

SHA-256 do ZIP: d4d89a83ce69e1463bb34724798dbe56bcf5ca47483ab91c4bce7fe2f5408c28
