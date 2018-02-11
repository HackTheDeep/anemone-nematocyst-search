class AddExtraDataToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :taxa, :string
    add_column :images, :specimen, :string
    add_column :images, :tissue, :string
  end
end
