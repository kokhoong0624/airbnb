class Search < ApplicationRecord
	def listings
		@listings ||= find_listings
	end

	private
	def find_listings
		byebug
		listings = Listing.order(:title)
		listings = listings.where("city like ?","%{city}%") if city.present?
		listings = listings.where("pricing >= ?", min_price) if min_price.present?
		listings = listings.where("pricing <= ?", max_price) if max_price.present?
		listings
	end

end
