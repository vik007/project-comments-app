require 'rails_helper'
require 'devise'
RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let!(:project) { create(:project) }

  before do
    sign_in user, scope: :user
    @request.session["warden.user.user.key"] = User.serialize_into_session(user)
  end

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:projects)).to include(project)
    end
  end

  describe "GET #show" do
    context "when project exists" do
      it "returns a successful response" do
        get :show, params: { id: project.id }
        expect(response).to have_http_status(:success)
      end
    end

    context "when project does not exist" do
      it "redirects to index with an alert" do
        get :show, params: { id: "non-existent" }
        expect(response).to redirect_to(projects_path)
        expect(flash[:alert]).to eq("Project not found.")
      end
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new project" do
        expect {
          post :create, params: { project: attributes_for(:project) }
        }.to change(Project, :count).by(1)
        expect(response).to redirect_to(assigns(:project))
      end
    end

    context "with invalid parameters" do
      it "does not create a project and renders new" do
        expect {
          post :create, params: { project: { title: "" } }
        }.not_to change(Project, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH/PUT #update" do
    context "with valid parameters" do
      it "updates the project" do
        put :update, params: { id: project.id, project: { title: "Updated Title" } }
        project.reload
        expect(project.title).to eq("Updated Title")
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid parameters" do
      it "does not update and re-renders edit" do
        put :update, params: { id: project.id, project: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the project and redirects" do
      expect {
        delete :destroy, params: { id: project.id }
      }.to change(Project, :count).by(-1)
      expect(response).to redirect_to(projects_path)
    end
  end
end
