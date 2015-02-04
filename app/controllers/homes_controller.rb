require 'open-uri'
class HomesController < ApplicationController
  def index

    url = "http://api.eia.gov/series/?api_key=ENV['API_KEY']&series_id=STEO.SOEPCAP_US.A"
    data = JSON.parse(open(url).read)
    binding.pry
  end
end
