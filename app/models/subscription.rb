class Subscription < ApplicationRecord
  enum status: %i[inactive active]
  validates :title, presence: true
  validates :price, presence: true
  validates :status, presence: true
  validates :frequency, presence: true

  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
