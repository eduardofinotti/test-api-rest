Then("I receive the code {string} and the message {string}") do |code, message|
  expect(@result.response.code).to eq code
  expect(@result.parsed_response['message']).to eq message
end

Then("I receive the code {string}") do |code|
  expect(@result.response.code).to eq code
end
