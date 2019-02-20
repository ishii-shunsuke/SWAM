class Cart < ApplicationRecord

	attachment:jacket_image


	belongs_to :user
	belongs_to :product

	def sum_of_price
    product.price * number
    end
end
