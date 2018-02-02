module PostsHelper
  def authorized_to_edit_post?(post)
    current_user && (current_user==post.user || current_user.moderator? ||
      current_user.admin?)
  end
  
  def authorized_to_delete_post?(post)
    current_user==post.user || current_user.admin?
  end
end
