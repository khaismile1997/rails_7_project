class ApplicationRecord < ActiveRecord::Base
  include Hashid::Rails
  self.abstract_class = true

  scope :by_hashids, (lambda do |hashids|
    where(id: decode_id(hashids).compact)
  end)
end
