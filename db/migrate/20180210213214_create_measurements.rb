class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements do |t|
      t.integer :image_id
      t.integer :feature_id
      t.integer :metric

      t.timestamps
    end

    add_foreign_key :measurements, :images
    add_foreign_key :measurements, :features
  end
end
