Before('@books') do
  @url_token = 'https://nbooks.herokuapp.com/api/token'
  body = {
  "email": "barbaracabral@gmail.com",
  "password": "123456"
  }
  result = NBooksAPI.post(
    @url_token.to_str,
    :body => body.to_json,
    :headers => {:content_type => 'application/json' }
  )
  @access_token = result.parsed_response['account_token']
  puts
end

Before('@inserting_a_account') do
  @url_token = 'https://nbooks.herokuapp.com/api/accounts'

  result = NBooksAPI.delete(
    @url_token.to_str,
    :body => {:email => "barbaracabral@gmail.com"},
    :headers => {:content_type => 'application/json' }
  )
end
