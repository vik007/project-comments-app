# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  def initialize(notice:)
    @notice = notice
  end
end
