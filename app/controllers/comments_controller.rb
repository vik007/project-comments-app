class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_comment, only: %i[destroy]

  # GET /comments/1/edit
  def index
    @comments = @project.comments.recent.includes(:user)
  end

  # POST /comments or /comments.json
  def create
    @comment = @project.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment.destroy
  end

  private

    def set_project
      @project = Project.friendly.find(params.require(:project_id))
    rescue ActiveRecord::RecordNotFound
      respond_to do |format|
        format.html { redirect_to projects_path, alert: "Project not found." }
      end
    end

    def set_comment
      @comment = current_user.comments.find(params.require(:id))
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
