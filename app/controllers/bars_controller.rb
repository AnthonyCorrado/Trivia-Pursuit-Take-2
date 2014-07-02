class BarsController < ApplicationController


  	def index
  	  @zip_search = params[:zipcode]
      client = Yelp::Client.new
      if @zip_search != nil
        @all_bars = Yelp.client.search(@zip_search, term: "bar trivia").businesses
      end
		end

		def show
		@bar = Bar.find(params[:id])
	end

	def new
		@bar = Bar.new
	end

	def create
		Bar.create(params.require(:bar).permit(:biz_id, :name, :street, :city_state_zip, :day, :time, :theme, :web, :lat, :lon)) if params[:status]
		redirect_to bars_path(@bar)
	end

	def edit
		@bar = Bar.find(params[:id])
	end

	def update
		@bar = Bar.find(params[:id])
		if @bar.update(params.require(:bar).permit(:biz_id, :name, :street, :city_state_zip, :day, :time, :theme, :web, :lat, :lon))
			redirect_to bars_path
		else
			render 'edit'
		end
	end



end
