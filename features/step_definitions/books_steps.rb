Given("I am on the books api page") do
  @url_token = 'https://nbooks.herokuapp.com/api/books'
end

When("I insert a new book") do
  values = {
    "title": "Dom Casmurro #{Random.rand(1..10)*121}",
    "author": "Machado de Assiss #{Random.rand(1..10)*121}",
    "tags": [
      "Romance",
      "Literatura"
    ]
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => values.to_json,
    :headers => {:content_type => 'application/json', ACCESS_TOKEN: @access_token }
  )
end

When("I insert a book already created") do
  values = {
    "title": "Dom Casmurro",
    "author": "Machado de Assiss",
    "tags": [
      "Romance",
      "Literatura"
    ]
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => values.to_json,
    :headers => {:content_type => 'application/json', ACCESS_TOKEN: @access_token }
  )
end


When("I GET a list of books without parameter") do
  @result = NBooksAPI.get(
    @url_token.to_str,
    :headers => {:content_type => 'application/json', ACCESS_TOKEN: @access_token }
  )
end

When("I GET the books related to the author {string}") do |string|
  query = {
    "author" => string,
    "title": "Dom Casmurro"
  }
  @result = NBooksAPI.get(
    @url_token.to_str,
    :query => query,
    :headers => {:content_type => 'application/json', ACCESS_TOKEN: @access_token }
  )
end

Then("I see the list of the books") do
  expect(@result.parsed_response.count).not_to eq 0
end

Then("I don't see any book on the list") do
  expect(@result.parsed_response.count).to eq 0
end
