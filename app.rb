require 'bundler/setup'
Bundler.require(:default)
Faraday.default_adapter = :em_synchrony
Dir["#{ File.dirname(__FILE__) }/lib/**/*.rb"].each { |file| require file }


class Server < Goliath::API
  include Goliath::Rack::Templates

  use Goliath::Rack::Params
  use Goliath::Rack::Validation::RequestMethod, %w(GET)
  use(Rack::Static,                     # render static files from ./public
    :root => Goliath::Application.app_path("public"),
    :urls => ["/favicon.ico", '/application.css', '/application.js'])

  def response(env)
    case env['PATH_INFO']
    when '/'
      [200, {}, slim(:index)]
    when '/info'
      artist = ArtistSearch.get(params['name'])
      [200, {}, Oj.dump(artist)]
    else
      [404, {}, '']
    end
  end
end
