# Bunny Havoc V45 — build modular (etapa 3)

[Baixar o pacote completo](Bunny_Havoc_V45_Modular.zip)

Vite + TypeScript no carregador e no build, mantendo o código de gameplay
preservado durante a migração gradual. As cenas continuam isoladas em iframes.
Three.js r128, músicas, scripts e estilos estão incluídos localmente.
O build, os tipos e as 13 suítes passaram. O ZIP foi testado no navegador por HTTP.

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
do motor, dos modelos ou das mecânicas nesta etapa. Os sistemas legados continuam
em JavaScript para serem convertidos gradualmente nas próximas etapas.

SHA-256 do ZIP: 73c456fa437b75a605763430893e8347347093217b9e24c346569b40ada39ae0
