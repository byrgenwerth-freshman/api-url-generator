require 'api_url_generator'
require 'minitest/autorun'
require 'models/generic_class'

module TestHelper
  APIURLGenerator.url("0.0.0.0:5000")

end