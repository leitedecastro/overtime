require 'rails_helper'

describe 'AuditLog feature' do

  describe 'index' do
    before do
      admin_user = FactoryGirl.create(:admin_user)
      login_as(admin_user, scope: :user)
      @audit_log = FactoryGirl.create(:audit_log)
    end

    it 'has an index page that can be reached' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(/DOE, JOHN/)
    end

    it 'cannot be accessed by non admin users' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end

