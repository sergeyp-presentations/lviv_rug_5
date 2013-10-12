require 'bundler/setup'
Bundler.require(:default)

Faraday.default_adapter = :em_synchrony

Dir["#{ File.dirname(__FILE__) }/lib/**/*.rb"].each { |file| require file }

require "#{ File.dirname(__FILE__) }/app"
