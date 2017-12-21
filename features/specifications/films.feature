# language: pt
Funcionalidade: CRUD actions to manipulate accounts

# Enviar um GET para a API http://swapi.co/api/films/ 
# e exibir o conteúdo do campo “title” de cada elemento da estrutura “results”. 
# Validar o statuscode da resposta da requisição.

Cenário: Listar todos os titulos
  Dado que eu estou na api de films
  Quando busco os filmes cadastrados 
  Então mostro os titulos dos filmes
  E tenho um retorno "200"