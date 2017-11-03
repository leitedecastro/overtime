class PostPolicy < ApplicationPolicy
  def update?
    (record.user_id == user.id && !record.approved?) || admin_types.include?(user.type)
  end
end
