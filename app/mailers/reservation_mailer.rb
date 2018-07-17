class ReservationMailer < ApplicationMailer

	def booking_email(customer, host, reservation)
		@user = customer
		@host = host
		@reservation = reservation
		mail(to: @user, subject: 'Congrats! Your booking has been confirmed!')
	end
end
