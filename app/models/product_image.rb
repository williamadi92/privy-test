class ProductImage < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :image, dependent: :destroy
end
