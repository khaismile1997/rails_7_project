class BrandSerializer < ApplicationSerializer
  BRAND_ATTRS = %i(
    name
    website_url
    founded_year
    primary_contact
    social_media_links
    featured_collections
  ).freeze

  attributes :id, *BRAND_ATTRS
end
