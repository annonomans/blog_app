require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it "ensures the presence of email" do
      user = User.new(email: "").save
      expect(user).to eq(false)
    end
  end
end