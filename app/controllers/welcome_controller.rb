class WelcomeController < ApplicationController
  def index
  	@listings = Listing.order("created_at DESC").page(params[:page]).per(5).all
  end
end