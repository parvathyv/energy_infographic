require 'open-uri'
class HomesController < ApplicationController
  def index
    @tsv = []
    url = "http://api.eia.gov/series/?api_key=88DB1E7BBE358836CE91CFFCB0E0F082&series_id=STEO.SORCBUS.Q "
    @data = JSON.parse(open(url).read)
    @data["series"].each do|arrayquar|
      arrayquar["data"].each do|info|
         @tsv << info.first+"\t" + info[1].to_s+"\r"
      end
    end
    @tsv
  end
end
