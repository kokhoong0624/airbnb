class Listing < ApplicationRecord
	belongs_to :user
  	mount_uploaders :images, ImageUploader
  	has_many :reservations, dependent: :destroy

	
end
