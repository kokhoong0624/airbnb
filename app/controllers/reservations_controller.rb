class ReservationsController < ApplicationController

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id

		@reservation.listing_id = params[:listing_id]
		if @reservation.save
			ReservationJob.perform_later(current_user.email,@reservation.listing.user.email,@reservation)
			redirect_to reservation_path(@reservation.id)
		else
			redirect_back(fallback_location: root_path)		
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
		  @client_token = Braintree::ClientToken.generate

	end

	private 
	def reservation_params
    	params.require(:reservation).permit(:start_date, :end_date)
  	end
end
