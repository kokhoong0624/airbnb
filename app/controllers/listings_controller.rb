class ListingsController < ApplicationController
before_action :require_login, only: [:new, :create]
before_action :check_update_rights, only: [:destroy, :edit]

before_action :find_listing, only: [:edit,:show,:destroy,:verification]

	def index
		redirect_to root_path
	end

	def create
		listing = Listing.new(listing_params)
		listing.user_id = current_user.id
		if listing.save
			redirect_to root_path
		else
			redirect_to :back
		end

	end


	def show
	end

	def edit
	end

	def verification
		if @listing.verification == true
			@listing.update(verification: false)
		else
			@listing.update(verification: true)
		end

		if @listing.save
			redirect_to listing_path(@listing)
		end
	end

	def search
		@listings = Listing.order(:title)
		@listings = @listings.where("city like ?", "%#{params[:city]}%") if params[:city].present?
		@listings = @listings.where("pricing >= ?", min_price) if params[:min_price].present?
		@listings = @listings.where("pricing <= ?", max_price) if params[:max_price].present?
		render "search"
	end


	private 
	def listing_params
    	params.require(:listing).permit(:title, :address, :city, :description, :pricing, :home_type, :room_type, :room_number, :accomodate, {images: []}, :amenities => [])
  	end

  	def find_listing
  		@listing = Listing.find(params[:id])
  	end

  	def check_update_rights
  		if current_user.id != @listing.user_id && current_user.admin?
  			redirect_to root_path
  		end
  	end

end
