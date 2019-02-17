class Product < ApplicationRecord
	has_many :carts
	has_many :users, through: :carts
	belongs_to :artist
	belongs_to :label
	belongs_to :category
	has_many :discs
end
