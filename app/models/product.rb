class Product < ApplicationRecord

attachment:jacket_image

has_many :discs, inverse_of: :product
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

belongs_to :artist, optional: true
belongs_to :label, optional: true
belongs_to :category, optional: true


end