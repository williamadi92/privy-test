class CategoryProduct < ApplicationRecord
  belongs_to :product, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
