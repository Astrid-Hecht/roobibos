class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, numericality: true
  validates :status, presence: true
  validates :frequency, numericality: { only_integer: true }
  enum status: %i[inactive active]

  belongs_to :customer
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
end
