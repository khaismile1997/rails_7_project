class BrandSerializer < ApplicationSerializer
  BRAND_ATTRS = %i(
    name
    logo
    website_url
    founded_year
    primary_contact
    social_media_links
  ).freeze

  attributes :id, *BRAND_ATTRS
end
