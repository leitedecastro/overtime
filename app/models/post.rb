class Post < ActiveRecord::Base
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  belongs_to :user
  validates_presence_of :date, :rationale, :overtime_request

  validates :overtime_request, numericality: { greater_than: 0.0 }

  scope :posts_by, ->(user) { where(user_id: user.id) }

  after_save :update_audit_log

  private

    # TODO: Fix this implementation to avoid inconsistences if the user deletes or changes a record
    def update_audit_log
      audit_log = AuditLog.where(user_id: self.user_id, start_date: (self.date - 7.days..self.date)).last
      if audit_log
        audit_log.confirmed!
      end
    end
end
