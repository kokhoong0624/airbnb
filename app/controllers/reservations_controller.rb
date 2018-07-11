class ReservationsController < ApplicationController

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id

		@reservation.listing_id = params[:listing_id]
		if @reservation.save
			redirect_to reservation_path(@reservation.id)
		else
			redirect_back(fallback_location: root_path)		
		end
	end

	def show
	end

	private 
	def reservation_params
    	params.require(:reservation).permit(:start_date, :end_date)
  	end
end
