class ReservationJob < ApplicationJob
  queue_as :default

  def perform(*args)
  	ReservationMailer.booking_email(args[0],args[1],args[2]).deliver_now

    # Do something later
  end
end
