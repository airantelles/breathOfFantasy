** Breath of Fantasy **

Para rodar o jogo, necessita ter o rails 6 e o ruby-dev instalados na máquina

Clonar o projeto, ir na pasta raiz dele e realizar os seguintes comandos:

Instalar as dependencias do projeto:<br />
`bundle install`

Fazer a migração dos dados:<br />
`rake db:migrate`

Rodar o console do Rails:<br />
`rails c`

Após estes passos, deve ser criado dois personagens com o seguinte comando (o primeiro campo representa o nome dele, o segundo os pontos de energia e o terceiro os pontos de poder):

`GameController.criar_personagem("Herói 80 45")`<br />
`GameController.criar_personagem("Vilão 80 45")`

Por fim, inicia-se o jogo com o seguinte comando e o será imprimido o resultado:<br />
`GameController.iniciar`
