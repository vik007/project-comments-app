class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :content, presence: true, length: { minimum: 5 }

  scope :recent, -> { order(created_at: :desc) }

  after_destroy_commit :destory_broadcast
  after_create_commit :create_broadcast

  private

  def destory_broadcast
    broadcast_remove_to(
      :comments_stream,
      target: "comment-#{id}-#{user_id}"
    )
  end

  def create_broadcast
    broadcast_prepend_to(
      :comments_stream,
      target: "comments-#{project.slug}",
      partial: "comments/comment", locals: { comment: self }
    )
  end
end
