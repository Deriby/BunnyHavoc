# Bunny Havoc V45 — áudios externos (etapa 2)

[Baixar o pacote completo](Bunny_Havoc_V45_Audio_Externo.zip)

As três músicas foram extraídas sem conversão. O HTML principal tem 908.424
bytes; os áudios ficam separados em assets/audio/. O jogo mantém o código,
visual, modelos, controles e mecânicas da V45. A bateria de 12 suítes passou.

Extraia o ZIP inteiro, mantendo a pasta assets junto dos HTMLs. Com Python 3,
abra um terminal nessa pasta e execute:

```
python -m http.server 8765 --bind 127.0.0.1
```

Abra http://127.0.0.1:8765/Bunny_Havoc_V45_Vila_JOGAR.html no navegador.
Também pode publicar a pasta em um servidor web estático. O HTML depende da
pasta de áudios. Three.js r128 continua vindo do CDN original, cdnjs.cloudflare.com.
Saves pertencem à origem (protocolo, host e porta) usada no navegador.

O HTML e o ZIP originais continuam preservados na entrega-v45 e no backup da
etapa 1. Esta entrega inclui as prévias da vila, personagens e cutscenes.

SHA-256 do ZIP: 1f1e846c688f486e46a8af69891e8c76cf1a79c074a20569523dd381f47e2803
