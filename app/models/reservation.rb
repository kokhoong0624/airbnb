class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :overlapping_reservations, :check_dates, :end_date_is_after_start_date



	def overlapping_reservations
		Reservation.where("listing_id =?",self.listing_id).each do |r|
			if overlaps?(r)
				return errors.add(:end_date,"cannot be before the start date!")
			end
		end
	end

	def check_dates
		if start_date.present? && start_date < Date.today
			errors.add(:start_date, "date cant be in the past!")
		end
	end

	def end_date_is_after_start_date
		return if end_date.blank? || start_date.blank?

		if end_date < start_date
			errors.add(:end_date, "cannot be before the start date")
		end
	end


	# def calculate_total_price
	# 	self.total_price = self.listing.pricing *(self.end_date - self.start_date).to_i
	# end






	private

	def overlaps?(other)
  		self.start_date <= other.end_date && other.start_date <= self.end_date
  	end	
end
