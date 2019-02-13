class Product < ApplicationRecord

attachment:jacket_image

has_many :discs, inverse_of: :product
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true


end