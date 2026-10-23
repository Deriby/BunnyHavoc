# Criar uma fase com as cenas prontas

Não é necessário anexar scripts manualmente. Use os arquivos **`.tscn` da pasta
`Cenas/`**: eles já incluem os modelos e os componentes necessários.
Os `.glb` em `Biblioteca/Modelos/` são os recursos visuais usados por essas cenas.
`ArvoreCopaRedonda.tscn` e `Pinheiro.tscn` já usam os modelos refinados, com
raízes, troncos irregulares e folhagem recortada; as instâncias existentes
recebem o visual automaticamente.

## Começar

1. Abra `ExemploNovaFase.tscn` no Godot.
2. Use **Cena → Salvar Cena Como** e dê outro nome, por exemplo `MinhaFase.tscn`.
3. Na árvore da cena, selecione `Objetos`.
4. Arraste uma cena da pasta `Cenas/` para `Objetos` e posicione-a no painel 3D.
5. Pressione **F6** para testar a cena aberta. F5 continua abrindo o Bosque Verde.
6. Na janela do jogo, ative **Entrada** para controlar o Bunnyck.

O exemplo já inclui jogador, câmera, chão, iluminação, combate, saúde e o
componente `Coleta`, que conta as recompensas. Mantenha esses componentes ao
começar; você pode remover os objetos de demonstração e colocar os seus.
Esse exemplo é uma ferramenta de criação, não uma fase nova da campanha.

## Elementos disponíveis

| Pasta | Cenas e uso |
| --- | --- |
| `Cenas/Natureza/` | Pinheiro, árvore de copa redonda, arbusto, tufo de grama, rocha, seixo, quatro flores e três cogumelos. |
| `Cenas/Coletaveis/` | `Cenoura.tscn`, com animação, coleta e som. |
| `Cenas/Caixas/` | `CaixaNormal.tscn` e `CaixaCenouras.tscn`; ambas herdam `CaixaBase.tscn`. |
| `Cenas/Caixas/CaixaTNT.tscn` | Também herda a base; golpe ou pisão acende o pavio e a explosão alcança caixas vizinhas. |
| `Cenas/Plataformas/` | `PlataformaMovel.tscn`, com modelo, colisão e trajetória. |
| `Cenas/Checkpoints/` | `Checkpoint.tscn`, com ativação, mudança de cor e ponto de reaparecimento. |
| `Cenas/Obstaculos/` | `Espinhos.tscn`, com detecção de contato e dano. |
| `Cenas/Personagens/` | Bunnyck com controles/sons e referência ao urso já existente. O exemplo mantém a integração de combate da etapa anterior. |
| `Cenas/Personagens/Besouro.tscn` | Patrulha, contato, combo/pisão e morte com bola solta. A coleta registra a recompensa automaticamente ao abrir a fase. |
| `Cenas/Personagens/Rufus.tscn` | Rotina de procurar objetos e conversa com Enter. Usa os controles/saúde presentes no exemplo. |

A base de caixas é para criar variantes; ao montar uma fase, prefira arrastar
`CaixaNormal` ou `CaixaCenouras`, que já têm o visual definido.

## Ajustar as instâncias

- **Cenoura:** a propriedade `Valor` define quantas cenouras ela acrescenta.
- **Caixa:** `Recompensa` começa em 5 na normal e 15 na caixa de cenouras.
- **Plataforma:** ajuste `Amplitude`, `Velocidade` e `Fase` no Inspetor. Ela se move
  ao redor da posição onde você a colocou.
- **Checkpoint:** clique com o botão direito na instância e habilite
  **Filhos editáveis**. Mova o marcador `Reaparecimento` para um ponto seguro.
  O volume em `Gatilho/CollisionShape3D` define a região de ativação.
- **Espinhos:** `Dano` e `Meia largura` controlam a área e o dano do contato.
- **Somente avanço:** no checkpoint, impede voltar a um ponto anterior no
  percurso de Z decrescente. O Bosque usa essa opção nos dois checkpoints.
- **Besouro:** `Amplitude`, `Fase` e `Velocidade` controlam sua patrulha lateral.
  Em uma cena plana, basta colocar no chão. No Bosque, a fase fornece o trilho
  de altura para acompanhar o relevo. Não coloque a patrulha sobre vãos.

Os objetos procuram o personagem chamado `Jogador`. O exemplo já usa esse
nome. Em uma estrutura diferente, você pode definir `Caminho jogador` no Inspetor.

Mover uma instância muda só aquela cópia. Editar a cena original `.tscn` atualiza
as instâncias dela. Para uma variante de comportamento, crie uma cena herdada;
as duas caixas fornecidas mostram esse padrão.

## Muitas árvores sem perder desempenho

Para uma região com muitas plantas, use `Cenas/Natureza/ConjuntoVegetacao.tscn`.
Habilite **Filhos editáveis** e arraste as cenas naturais para `Instancias`.
No editor cada árvore continua separada e pode ser movida ou removida.
Ao executar, o componente agrupa as malhas repetidas em `MultiMesh`.

O Bosque Verde já usa esse sistema. A propriedade `Otimizar em execucao` pode
ser desligada para comparar a renderização com as instâncias individuais.
Não coloque cenouras, caixas ou personagens nesse conjunto: ele é destinado
a elementos estáticos do cenário.

## O que continua específico de cada fase

O terreno, os buracos, os limites, o trilho de câmera e o progresso pertencem à
composição da fase. Em `Fase1/`, `Objetos.tscn` e `Vegetacao.tscn` contêm as
instâncias do bosque; `Cenario.tscn` combina terreno e vegetação. O script
`trecho.gd` conecta o checkpoint, o HUD e a conclusão do recorte.
`Fase1/Trecho2/` contém a continuação aditiva, composta com as mesmas cenas,
até o segundo checkpoint. A cena principal conecta a altura do terreno aos
atores dessa região; o exemplo independente permanece uma base plana.

Depois da extração inicial, edite as cenas no Godot. Os exportadores e geradores
em `tools/` são ferramentas de migração: eles recriam a composição original e
podem sobrescrever arquivos gerados. Preserve suas edições antes de regenerar;
eles não são necessários para montar ou jogar novas fases no editor.

A fase completa, a vila, demais NPCs e campanha ainda serão migrados. O checkpoint vale
para a tentativa atual e ainda não salva progresso entre sessões.
