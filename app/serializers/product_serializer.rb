class ProductSerializer < ApplicationSerializer
  PRODUCT_ATTRS = %i(
    name
    description
    material
    size_options
    color_options
    care_instructions
    price
  ).freeze

  attributes :id, *PRODUCT_ATTRS
end
