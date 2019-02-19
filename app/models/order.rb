class Order < ApplicationRecord
	has_many :buy_products
	belongs_to :user
	enum shipping_status: {準備中:1,配送中:2,配送済:3}
end
