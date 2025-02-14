module AuditHistoriesHelper
  def formatted_audit_change(field, change)
    changes = Array.wrap(change)

    content_tag(:p) do
      concat content_tag(:span, "#{field.to_s.titlecase} has changed", class: "font-medium me-1")
      concat audit_change_badge(changes.first)
      if changes.second.present?
        concat " to "
        concat audit_change_badge(changes.second)
      end
    end
  end

  private

  def audit_change_badge(value)
    content_tag(:span, value.to_s.titlecase, class: "inline-flex items-center rounded-md bg-gray-50 px-2 py-1 text-sm font-medium text-gray-700 border mx-2")
  end
end
