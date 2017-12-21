Dado("que eu estou na api de films") do
  @url_token = 'http://swapi.co/api/films/'
end

Quando("busco os filmes cadastrados") do 

  query = {
    
  }
  @result = NBooksAPI.get(
    @url_token.to_str,
    :query => query,
    :headers => {:content_type => 'application/json'}
  )

  parsedx = JSON.parse(@result.response.body)
  #binding.pry
  
  # until (parsedx['results'][0]['title']) == nil do
  #   puts parsedx['results'][0]['title']
  # end
  
  for i in (0..parsedx['results'].length-1) do
    puts parsedx['results'][i]['title']
  end

end

Então("mostro os titulos dos filmes") do
  p "Listar títulos"
end

Então("tenho um retorno {string}") do |code|
  expect(@result.response.code).to eq code
end


# ==================================================== #


Given("I am on the accounts api page") do
 @url_token = 'https://nbooks.herokuapp.com/api/accounts'
end

When("I insert a new account") do
  values = {
    "name": "Bárbara",
    "email": "barbaracabral#{Random.rand(1..10)*121}@gmail.com",
    "password": "123456"
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => values.to_json,
    :headers => {:content_type => 'application/json'}
  )
end

When("I insert an account already created") do
  values = {
    "name": "Bárbara",
    "email": "barbaracabral@gmail.com",
    "password": "123456"
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => values.to_json,
    :headers => {:content_type => 'application/json'}
  )
end

When("I get an account already created") do
  query = {
    "email" => "barbaracabral@gmail.com"
  }
  @result = NBooksAPI.get(
    @url_token.to_str,
    :query => query,
    :headers => {:content_type => 'application/json'}
  )
end
