class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images, id: false do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :image, foreign_key: true
    end
  end
end
