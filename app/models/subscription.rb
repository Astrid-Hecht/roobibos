class Subscription < ApplicationRecord
  enum status: %i[inactive active]

  belongs_to :customer, dependent: :destroy
  has_many :teas, through: :subscription_teas
end
