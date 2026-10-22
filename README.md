# Bunny Havoc V45 — build modular (etapa 5)

[Baixar o pacote completo](Bunny_Havoc_V45_Modular.zip)

Controle das músicas e armazenamento de opções convertidos para módulos
TypeScript, preservando as operações da V45, os campos antigos e as APIs dos iframes. As cenas continuam isoladas em iframes.
Three.js r128, músicas, scripts e estilos estão incluídos localmente.
O build, os tipos e as 15 suítes passaram. O ZIP foi testado no navegador por HTTP.

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
do motor, dos modelos ou das mecânicas nesta etapa. A lógica das fases, menus e efeitos sonoros continua
em JavaScript para ser convertida gradualmente nas próximas etapas.

SHA-256 do ZIP: a2120b9e4240f87ce75a13e69ca25c02a81a8fa78b0683d88308a6e7d8fb7db5
