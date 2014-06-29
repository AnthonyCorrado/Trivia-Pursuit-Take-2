class BarsController < ApplicationController


  	def index
  	  @zip_search = params[:zipcode]
      client = Yelp::Client.new
      if @zip_search != nil
        @all_bars = Yelp.client.search(@zip_search, term: "bar trivia").businesses
      end
		end


end
