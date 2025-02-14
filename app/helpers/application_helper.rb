module ApplicationHelper
  def time_in_word(time)
    "#{time_ago_in_words(time)} ago"
  end

  def comment_author?(comment)
    comment.user_id == current_user&.id
  rescue StandardError
    false
  end
end
