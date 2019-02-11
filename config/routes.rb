Rails.application.routes.draw do


	root 'users/products#top'
	get '/admins/top', to:'admins/products#top'
	get '/order/set_address', to:'users/orders#set_address'
	get '/order/confirmation/:shipping_address_id', to:'users/orders#new', as:'order_confirmation'
	post '/order', to:'users/orders#create'
	get '/order/complete', to:'users/orders#show'
	get '/order_address/new', to:'users/shipping_addresses#new_when_order'
<<<<<<< HEAD
	get '/products/:id' => 'users/products#show'
=======
	post '/order_address', to:'users/shipping_addresses#create_when_order'
>>>>>>> effc800154c15d0721991f56fe34023db3114e0c
	namespace :users do
		resources :shipping_addresses
		resources :products, only: [:index, :show]
	end
	resources :carts, only: [:index, :create, :update, :destroy]
	namespace :admins do
		resources :users, only: [:index, :show, :edit ,:update, :destroy]
		resources :products
		resources :orders, only: [:index, :update]
	end
end
