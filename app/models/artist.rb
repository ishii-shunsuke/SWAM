class Artist < ApplicationRecord

	has_many :products, inverse_of: :product
    accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true

end
