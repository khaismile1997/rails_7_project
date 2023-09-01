class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.string :website_url, null: false
      t.integer :founded_year, null: false
      t.string :primary_contact
      t.text :social_media_links
      t.text :featured_collections

      t.timestamps
    end
  end
end
