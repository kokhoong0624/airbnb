class Listing < ApplicationRecord
	belongs_to :user
  	mount_uploaders :images, ImageUploader
  	has_many :reservations, dependent: :destroy

  	# scope :check_title, => (search_title) {where("title ILIKE ?","#{search_title}"}
	
end
