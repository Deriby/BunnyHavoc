# Bunny Havoc V45 — build modular (etapa 4)

[Baixar o pacote completo](Bunny_Havoc_V45_Modular.zip)

Campanha, progressão e persistência dos três saves convertidas para módulos
TypeScript, preservando as regras da V45, as chaves e o backup JSON V9. As cenas continuam isoladas em iframes.
Three.js r128, músicas, scripts e estilos estão incluídos localmente.
O build, os tipos e as 14 suítes passaram. O ZIP foi testado no navegador por HTTP.

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
do motor, dos modelos ou das mecânicas nesta etapa. A lógica das fases, menus e áudio continua
em JavaScript para ser convertida gradualmente nas próximas etapas.

SHA-256 do ZIP: 60ffc402907cbc80bcdbe4aeab04eff0c3eb0de9374221597c5be5ad27e87c3d
