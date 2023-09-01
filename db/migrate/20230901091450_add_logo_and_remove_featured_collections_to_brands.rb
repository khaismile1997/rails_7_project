class AddLogoAndRemoveFeaturedCollectionsToBrands < ActiveRecord::Migration[7.0]
  def change
    add_column :brands, :logo, :string
    remove_column :brands, :featured_collections, :string
  end
end
