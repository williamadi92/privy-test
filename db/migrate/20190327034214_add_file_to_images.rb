class AddFileToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :file, :string
  end
end
