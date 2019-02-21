class Product < ApplicationRecord

attachment :jacket_image

has_many :carts, dependent: :destroy
has_many :users, through: :carts, dependent: :destroy
has_many :discs, inverse_of: :product, dependent: :destroy
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

belongs_to :artist
belongs_to :label, optional: true
belongs_to :category, optional: true

end
