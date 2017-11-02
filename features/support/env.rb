require 'cucumber'
require 'httparty'
require 'rspec'
require 'json'
require 'pry'

class NBooksAPI
  include HTTParty
  base_uri 'https://nbooks.herokuapp.com/'
  default_params output: 'json'
end
