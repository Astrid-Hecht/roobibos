class Tea < ApplicationRecord
  has_many :subscriptions, through: :subscription_teas
end
