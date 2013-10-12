class ArtistPool
  include Celluloid

  def get(q)
    ArtistSearch.new(q).to_hash
  end
end
