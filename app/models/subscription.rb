class Subscription < ApplicationRecord
  enum status: %i[inactive active]
  
  belongs_to :user, dependent: :destroy
end
