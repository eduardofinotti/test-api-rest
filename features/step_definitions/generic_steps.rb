Então("tenho um retorno {string}") do |code|
  expect(@result.response.code).to eq code
end