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
  
end

Então("mostro os titulos dos filmes") do
  parsedx = JSON.parse(@result.response.body)
  
  for i in (0..parsedx['results'].length-1) do
    puts parsedx['results'][i]['title']
  end

end

Então("mostro os títulos que sejam do diretor {string} e que o produtor {string} tenha participado") do |diretor, produtor|
  parsedx = JSON.parse(@result.response.body)
  
  for i in (0..parsedx['results'].length-1) do
    if (parsedx['results'][i]['director'] == diretor) 
      
      if (parsedx['results'][i]['producer'].include? produtor) 
        puts parsedx['results'][i]['title']
      end  
      
    end
  end

end