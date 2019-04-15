require 'simplecov'
SimpleCov.start
require 'rspec'
require "./lib/enigma.rb"
require "./lib/cipher"
require "./lib/offset_generator"
require "./lib/key_generator"
RSpec.configure do |config|
  config.filter_run_when_matching :focus
end
