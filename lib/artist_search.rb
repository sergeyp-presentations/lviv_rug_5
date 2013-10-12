class ArtistSearch < Struct.new(:raw)
  def self.get(q)
    params = { :method => "artist.getinfo", :artist => q,
               :api_key => "f7cf6bd1259c914981bc574b50a82b04", :format => "json" }
    response = Faraday.get "http://ws.audioscrobbler.com/2.0/", params
    raw = Oj.load(response.body)["artist"]
    new(raw).to_hash
  end

  def to_hash
    {
      "name"      => raw["name"],
      "bio"       => raw["bio"]["summary"],
      "image"     => image,
      "ontor"     => raw["ontour"].to_i,
      "listeners" => raw["stats"]["listeners"],
      "playcount" => raw["stats"]["playcount"]
    }
  end

  private

  def image
    node = raw["image"].detect { |item| item["size"] == "extralarge" }
    node['#text']
  end
end
