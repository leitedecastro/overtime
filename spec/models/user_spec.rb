require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without phone" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it "requires the phone attr to only contains" do
      ["myownphone", "123-567890"].map do |value|
        @user.phone = value
        expect(@user).to_not be_valid
      end
    end

    it "requires the phone attr to only have 10 chars" do
      ["123456789", "12345678901"].map do |value|
        @user.phone = value
        expect(@user).to_not be_valid
      end
    end

  end

  describe "custom methods" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq "DOE, JOHN"
    end
  end
end
