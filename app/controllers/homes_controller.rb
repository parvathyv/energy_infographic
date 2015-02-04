require 'open-uri'
class HomesController < ApplicationController
  def index
    #url = "http://api.eia.gov/category/?api_key=88DB1E7BBE358836CE91CFFCB0E0F082&category_id=35"
    url = "http://api.eia.gov/series/?api_key=88DB1E7BBE358836CE91CFFCB0E0F082&series_id=ELEC.CONS_TOT.COW-AL-98.A"
    data = JSON.parse(open(url).read)
    binding.pry
  end
end
