Given("I am on the books api token page") do
  @url_token = 'https://nbooks.herokuapp.com/api/token'
end

When("I inform the wrong login data") do
  @result = NBooksAPI.post(
    @url_token.to_str,
    :values => {:email => 'eu@papito.io', :password => 'secret' },
    :headers => {:content_type => 'application/json' }
  )
end

When("I inform an invalid email") do
  body = {
  "email": "barbaracabral@qualquercoisa.com",
  "password": "123456"
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => body.to_json,
    :headers => {:content_type => 'application/json' }
  )
end

When("I inform a valid email") do
  body = {
  "email": "barbaracabral@gmail.com",
  "password": "123456"
  }
  @result = NBooksAPI.post(
    @url_token.to_str,
    :body => body.to_json,
    :headers => {:content_type => 'application/json' }
  )
end

Then("I receive the my access token") do
  @access_token = @result.parsed_response['account_token']
  expect(@result.response.code).to eq "200"
end
