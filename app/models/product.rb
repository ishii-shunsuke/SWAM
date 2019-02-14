class Product < ApplicationRecord
	has_many :carts
	has_many :users, through: :carts
	has_many :artists
	has_many :labels
	has_many :categories
	has_many :discs
end
