module ApplicationHelper

  	def full_name(user)
  		"#{user.last_name} #{user.first_name}"
  	end


  	def full_address(address)
  		"#{address.prefectures} #{address.city} #{address.block}"
  	end

  	def order_total(order)
  		total = 0
  		order.buy_products.each do |buy_product|
  			total += buy_product.buy_price * buy_product.buy_number
  		end
  		total
  	end

    def cart_total(cart)
      total = 0
      cart.each do |cart|
        total += cart.product.price * cart.number
      end
      total
    end

    def cart_number_total(cart)
      total = 0
      cart.each do |cart|
        total += cart.number
      end
      total
    end
end
