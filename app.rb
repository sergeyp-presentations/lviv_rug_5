class FrontEndApp < Sinatra::Base
  get '/' do
    slim :index
  end
end

class ApiApp < Sinatra::Base
  register Sinatra::Synchrony

  get '/' do
    content_type :json
    artist = ArtistSearch.get(params[:name])
    Oj.dump(artist)
  end
end
