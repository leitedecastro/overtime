require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@example.com", password: "asdfasdf",
      password_confirmation: "asdfasdf", first_name: "Paulo",
      last_name: "Castro")
  end
  
  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
    
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    
    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
  
  describe "custom methods" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq "CASTRO, PAULO"
    end
  end
end