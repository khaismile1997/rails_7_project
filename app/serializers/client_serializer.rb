class ClientSerializer < ApplicationSerializer
  CLIENT_ATTRS = %i(
    email
    payout_rate
  ).freeze

  attributes :id, *CLIENT_ATTRS
end
