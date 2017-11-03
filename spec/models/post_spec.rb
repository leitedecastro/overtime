require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "Creation" do

    before do
      @post = FactoryGirl.create(:post)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it "cannot be created without a date" do
      @post.date = nil
      expect(@post).to_not be_valid
    end

    it "cannot be created without a rationale" do
      @post.rationale = nil
      expect(@post).to_not be_valid
    end

    it "cannot be created without a overtime_request" do
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end

    it "cannot be created without a overtime_request greather than 0.0" do
      @post.overtime_request = 0.0
      expect(@post).to_not be_valid
    end

  end
end
