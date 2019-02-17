class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< Updated upstream

   def full_name
   	[last_name, first_name].join("")
   end
=======
  has_many :shipping_addresses
  has_many :orders
  has_many :carts
  has_many :products, through: :carts
  acts_as_paranoid
>>>>>>> Stashed changes
end
