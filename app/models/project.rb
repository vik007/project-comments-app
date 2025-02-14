# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  title       :string           not null  # Required for FriendlyId
#  status      :integer          default: 0, null: false
#  description :text
#  slug        :string           unique
#
class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :comments, dependent: :destroy

  STATUS = { pending: 0, in_progress: 1, completed: 2, on_hold: 3 }
  enum :status, STATUS

  validates :title, presence: true

  audited only: %i[status], max_audits: 100

  def self.select_options
    STATUS.keys.map { |x| [ x.to_s.titlecase, x ] }
  end
end
