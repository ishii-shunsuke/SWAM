Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
   sessions:      'users/sessions',
   passwords:     'users/passwords',
   registrations: 'users/registrations'
}
	root 'users/products#top'
	get '/admins/top', to:'admins/products#top'
	get '/users', to:'users#show', as:'users'
	get '/order/set_address', to:'users/orders#set_address'
	get '/order/confirmation/:shipping_address_id', to:'users/orders#new', as:'order_confirmation'
	post '/order', to:'users/orders#create'
	get '/order/complete', to:'users/orders#show'
	get '/order_address/new', to:'users/shipping_addresses#new_when_order'
	post '/order_address', to:'users/shipping_addresses#create_when_order'
	get 'search', to: 'products#search', as: :search
	post '/admins/products/new/artist_create', to: 'admins/products#artist_create'
	post '/admins/products/new/label_create', to: 'admins/products#label_create'
	post '/admins/products/new/category_create', to: 'admins/products#category_create'
	post '/admins/products/new/create', to: 'admins/products#create'
	# patch '/admins/products/new/artist_update', to: 'admins/products#artist_update'
	# patch '/admins/products/new/label_update', to: 'admins/products#label_update'
	# patch '/admins/products/new/category_update', to: 'admins/products#category_update'
	# patch '/admins/products/new/update', to: 'admins/products#update'
	# post '/users/products', to:'carts#create'
	namespace :users do
		resources :shipping_addresses
		resources :products, only: [:index, :show]
		get 'search', to: 'products#search'
	end
	resources :carts, only: [:index, :create, :update, :destroy]
	namespace :admins do
		resources :users, only: [:index, :show, :edit ,:update, :destroy]
		resources :products
		resources :orders, only: [:index, :update]
	end

	devise_scope :user do
    	get 'cart/sign_in/:product_id/:number', to: 'users/sessions#new'
  	end
end