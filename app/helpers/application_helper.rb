module ApplicationHelper
  def admin_types
    ['AdminUser']
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def employee?
    current_user.type == "Employee"
  end

  def active?(path)
    "active" if current_page?(path)
  end

  def status_label(status)
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: "label label-primary")
    when 'approved'
      content_tag(:span, status.titleize, class: "label label-success")
    when 'rejected'
      content_tag(:span, status.titleize, class: "label label-danger")
    when 'pending'
      content_tag(:span, status.titleize, class: "label label-primary")
    when 'confirmed'
      content_tag(:span, status.titleize, class: "label label-success")
    end
  end
end
