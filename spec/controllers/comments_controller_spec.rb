require "rails_helper"
require 'devise'
RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  before do
    sign_in user, scope: :user# Devise helper to authenticate user
      @request.session["warden.user.user.key"] = User.serialize_into_session(user)
  end
  describe "GET #index" do
    it "returns a successful turbo_stream response and assigns @comments" do
      get :index, params: { project_id: project.id }, format: :turbo_stream
      expect(response).to have_http_status(:ok)
      expect(assigns(:comments)).to eq(project.comments.recent)
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new comment and responds with turbo_stream" do
        expect {
          post :create, params: { project_id: project.id, comment: { content: "New comment" } }, format: :turbo_stream
        }.to change(project.comments, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end
  end
end
