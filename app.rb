require 'bundler/setup'
Bundler.require(:default)
Faraday.default_adapter = :em_synchrony
Dir["#{ File.dirname(__FILE__) }/lib/**/*.rb"].each { |file| require file }


class Server < Helmet::API
  use(Rack::Static,                     # render static files from ./public
    :root => Goliath::Application.app_path("public"),
    :urls => ["/favicon.ico", '/application.css', '/application.js'])

  get '/' do
    erb(:index)
  end

  get '/info' do
    content_type :json
    artist = ArtistSearch.get(params['name'])
    Oj.dump(artist)
  end
end
