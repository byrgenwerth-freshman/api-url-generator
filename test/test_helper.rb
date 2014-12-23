require 'api_url_generator'
require 'minitest/autorun'
require 'models/generic_class'
require 'models/generic_polymorphic_klass'

module TestHelper
  APIURLGenerator.url("0.0.0.0:5000")

end