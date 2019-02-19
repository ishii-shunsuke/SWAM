module ApplicationHelper
	# def logged_in?
 #    	!current_user.nil?
 #  	end

  	def full_name(user)
  		"#{user.last_name} #{user.first_name}"
  	end

  	def full_address(address)
  		"#{address.prefectures} #{address.city} #{address.block}"
  	end

  	def order_total(order)
  		total = 0
  		order.buy_products.each do |buy_product|
  			total += buy_product.buy_price
  		end
  		total
  	end
end
