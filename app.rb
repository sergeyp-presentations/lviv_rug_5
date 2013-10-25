class ArtistsApp < Sinatra::Base
  set :pool, ArtistPool.pool(:size => 16)

  get '/' do
    slim :index
  end

  get '/info' do
    content_type :json
    artists = params[:names].map { |q| settings.pool.future(:get, q) }.map { |promise| promise.value }
    Oj.dump(artists)
  end
end
