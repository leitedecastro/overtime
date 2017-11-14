require 'rails_helper'

describe 'Homepage' do
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
