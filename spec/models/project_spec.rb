require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'friendly_id' do
    let!(:project) { create(:project, title: 'My Test Project') }

    it 'generates a slug from the title' do
      expect(project.slug).to eq('my-test-project')
    end
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(pending: 0, in_progress: 1, completed: 2, on_hold: 3) }
  end

  describe '.select_options' do
    it 'returns a formatted array of status options' do
      expect(Project.select_options).to eq([
        [ 'Pending', :pending ],
        [ 'In Progress', :in_progress ],
        [ 'Completed', :completed ],
        [ 'On Hold', :on_hold ]
      ])
    end
  end
end
