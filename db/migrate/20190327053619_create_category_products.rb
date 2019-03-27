class CreateCategoryProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :category_products, id: false do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :category, foreign_key: true
    end
  end
end
