class PostPolicy < ApplicationPolicy
  def update?
    (record.user_id == user.id && !record.approved?) || admin?
  end

  def approve?
    admin?
  end

  private
    def admin?
      admin_types.include?(user.type)
    end
end
