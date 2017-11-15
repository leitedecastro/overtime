require 'rails_helper'

describe 'Homepage' do
  describe 'Admin Dashboard' do
    before do
      @post = FactoryGirl.create(:post)
      @admin_user = FactoryGirl.create(:admin_user)
      login_as(@admin_user, scope: :user)
    end

    it 'allows the admin to approve posts from the homepage' do
      visit root_path
      click_link("approve_#{@post.id}")

      expect(@post.reload.status).to eq("approved")
    end

    it 'prevent nonusers to approve posts' do
      login_as(@post.user, scope: :user)
      visit approve_post_path(@post)

      expect(@post.reload.status).to_not eq("approved")
    end
  end

  describe 'Employee Dashboard' do
    it "allow the employee to change the audit log status from the homepage" do
      user = FactoryGirl.create(:user)
      audit_log = FactoryGirl.create(:audit_log, user: user)
      login_as(user, scope: :user)

      visit root_path
      click_link("confirm_#{audit_log.id}")

      expect(audit_log.reload.status).to eq("confirmed")
    end
  end
end
