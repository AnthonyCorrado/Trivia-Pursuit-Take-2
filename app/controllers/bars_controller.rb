class BarsController < ApplicationController
	include Yelp::V2::Search::Request

  	def search
     client = Yelp::Client.new

     request = GeoPoint.new(
                 :term => 'thai',
                 :category_filter => 'food,restaurants',
                 :limit => 20,
                 :radius_filter => 8047,
                 :latitude => params[:latitude],
                 :longitude => params[:longitude])
     response = client.search(request)

     # rest of your code
    end


end
