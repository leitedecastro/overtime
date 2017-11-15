class AuditLogPolicy < ApplicationPolicy
  def index?
    admin_types.include?(user.type)
  end

  def confirm?
    record.user.id == user.id
  end
end
