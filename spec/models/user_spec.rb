require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
  end

  context "associations" do
    #it { should have_many(:orders) }
  end

  context "admin" do
    it "ensures new user is not admin" do
      user = create(:user)
      expect(user.admin?).to eq(false)
    end
  end
end
