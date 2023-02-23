class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :frequency, :status
  belongs_to :customer
end