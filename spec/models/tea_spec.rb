require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "relationships" do
    it { should have_many(:subscriptions).through(:subscription_teas) }
  end
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end
end
