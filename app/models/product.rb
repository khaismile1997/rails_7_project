class Product < ApplicationRecord
  belongs_to :brand

  validates :name, :price, presence: true
  validates :name, uniqueness: { scope: :brand_id }
  monetize :price_cents, :allow_nil => true

  enum state: { active: 0, inactive: 1 }
end
