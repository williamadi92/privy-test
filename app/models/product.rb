class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :enable, presence: true
end
