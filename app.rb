class ArtistsApp < Sinatra::Base
  get '/' do
    slim :index
  end

  get '/info' do
    content_type :json
    artists = ArtistSearch.get(params[:names])
    Oj.dump(artists)
  end
end
