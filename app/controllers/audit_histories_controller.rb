class AuditHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auditable

  def index
    @audits = @auditable.audits.descending
  end

  private

  def set_auditable
    if params[:project_id]
      @auditable = Project.friendly.find(params[:project_id])
    elsif params[:comment_id]
      @auditable = Comment.find(params[:comment_id])
    else
      redirect_to root_path, alert: "Invalid audit history request."
    end
  end
end
