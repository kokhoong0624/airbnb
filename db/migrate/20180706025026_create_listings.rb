class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
    	t.string :home_type
    	t.string :room_type
    	t.integer :room_number
    	t.integer :accomodate
    	t.string :city
    	t.integer :pricing
    	t.string :currency
    	t.string :title
    	t.string :description
    	t.string :address
    	t.text :amenities, array: :true, default: []
    	t.belongs_to :user

      t.timestamps
    end
  end
end
