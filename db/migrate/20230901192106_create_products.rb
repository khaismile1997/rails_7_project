class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.string :material
      t.string :size_options
      t.string :color_options
      t.string :care_instructions
      t.monetize :price, null: false
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
