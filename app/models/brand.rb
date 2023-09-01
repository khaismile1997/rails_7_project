class Brand < ApplicationRecord
  validates :name, :website_url, :founded_year, :logo, presence: true
  validates :name, uniqueness: true
  validates :website_url, format: URI::regexp(%w[http https])
  validates :founded_year, numericality: { only_integer: true, greater_than: 0 }

  serialize :social_media_links, JSON
end
