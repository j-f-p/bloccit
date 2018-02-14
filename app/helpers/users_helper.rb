module UsersHelper
  def user_posts
    if @user.posts.count > 0
      concat content_tag(:h2, "Posts")
      concat render @user.posts
    else
      concat content_tag(:p, "#{@user.name} has not submitted any posts yet.")
    end
  end
  
  def user_comments
    if @user.comments.count > 0
      concat content_tag(:h2, "Comments")
      concat render @user.comments
    else
      concat content_tag(:p,
        "#{@user.name} has not submitted any comments yet.")
    end
  end
end
