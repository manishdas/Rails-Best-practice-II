class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  def recent_commenters
    self.comments.recent(5).includes(:user).collect{|comment| comment.user.login}.map{|commenter| "<li>#{commenter}</li>"}.join("")
  end

  def to_param
    "#{id}-#{self.user.username}"
  end
end

