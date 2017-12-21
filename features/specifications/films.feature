# language: pt
Funcionalidade: Listar livros

# Enviar um GET para a API http://swapi.co/api/films/ 
# e exibir o conteúdo do campo “title” de cada elemento da estrutura “results”. 
# Validar o statuscode da resposta da requisição.

Cenário: Listar todos os titulos
  Dado que eu estou na api de films
  Quando busco os filmes cadastrados 
  Então mostro os titulos dos filmes
  E tenho um retorno "200"

# Enviar um GET para a API http://swapi.co/api/films/, 
# validar o status-code da resposta, armazenar o corpo da resposta em uma variável 
# e exibir todos os títulos que sejam do diretor George Lucas 
# e que o produtor Rick McCallum tenha participado.

Cenário: Listar filmes do diretor "George Lucas" e que o produtor "Rick McCallum" tenha participado
  Dado que eu estou na api de films
  Quando busco os filmes cadastrados 
  Então tenho um retorno "200"
  E mostro os títulos que sejam do diretor "George Lucas" e que o produtor "Rick McCallum" tenha participado