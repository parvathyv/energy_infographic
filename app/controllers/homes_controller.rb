require 'open-uri'
require 'CSV'
class HomesController < ApplicationController
  def index
    @dataarr = []
    @dataarr << ['Year', 'QA']
    color_array = ['silver','gold']
    @csv = {}
    url = "http://api.eia.gov/series/?api_key=88DB1E7BBE358836CE91CFFCB0E0F082&series_id=STEO.SORCBUS.Q "
    @data = JSON.parse(open(url).read)
    @data["series"].each do|arrayquar|
      arrayquar["data"].each do|info|
         @csv[info.first] = info[1].to_s
      end
    end

    CSV.open("myfile.csv", "w", write_headers: true,
    headers: ["Date","Quantity"]) do |csv|
      @csv.map do|key, value|
        csv << [key.split('Q').first.to_i, value]
        @dataarr << [key.split('Q').first.to_i, value.to_f]
      end
    end
    @dataarr
  end

end
