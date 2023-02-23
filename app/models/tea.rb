class Tea < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :temperature, numericality: true
  validates :brew_time, numericality: { only_integer: true }

  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas
end
