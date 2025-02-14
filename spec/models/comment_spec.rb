# spec/models/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:project) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_least(5) }
  end

  describe 'scopes' do
    describe '.recent' do
      let!(:old_comment) { create(:comment, created_at: 1.week.ago) }
      let!(:new_comment) { create(:comment, created_at: 1.day.ago) }

      it 'returns comments in descending order of creation' do
        expect(Comment.recent).to eq([ new_comment, old_comment ])
      end
    end
  end
end
