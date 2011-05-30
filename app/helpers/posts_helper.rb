module PostsHelper
  def comments(post)
    Comment.where(:post_id => post.id).each do |comment|
      content_tag :p do
        raw(
        "<i>Commented on:"+ comment.created_at + "</i><br/>" +
        "<i>Commented by:" + comment.user.login + "::" + comment.commenter_address + "</i><br/>" + comment.text
        )
      end
    end
  end
end
