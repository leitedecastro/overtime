class StaticController < ApplicationController

  def homepage
    # TODO: look for a way to do this inside User class 
    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted
      @recent_audit_items = AuditLog.last(10)
    else
      # something else
    end
  end

end
