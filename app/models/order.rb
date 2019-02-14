class Order < ApplicationRecord
	has_many :buy_products
	belongs_to :user
end
