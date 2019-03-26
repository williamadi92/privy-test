class Category < ApplicationRecord
    validates :name, presence: true
    validates :enable, presence: true
end
