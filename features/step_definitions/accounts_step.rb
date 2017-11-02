
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
