# frozen_string_literal: true

class ProjectDetailsComponent < ViewComponent::Base
  def initialize(project:)
    @project = project
  end
end
