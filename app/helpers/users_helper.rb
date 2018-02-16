module UsersHelper
  def user_posts(user)
    if user.posts.count > 0
      concat content_tag(:h2, "Posts")
      concat render user.posts
      return true
    else
      concat content_tag(:p, "#{user.name} has not submitted any posts.")
      return false
    end
  end
  
  def user_comments(user)
    if user.comments.count > 0
      concat content_tag(:h2, "Comments")
      concat render user.comments
      return true
    else
      concat content_tag(:p, "#{user.name} has not submitted any comments.")
      return false
    end
  end
  
  def user_fav_posts(user)
    fav_posts = Post.find(Favorite.where(user_id: user.id).pluck(:post_id))
    if fav_posts.present?
      concat content_tag(:h2, "Favorite Posts")
      fav_posts.each do |post|
        concat render({ partial: 'posts/fav_posts',
          locals: {post: post} })
      end
      return true
    else
      concat content_tag(:p,
        "#{user.name} has not selected any favorite posts.")
      return false
    end
  end
end
