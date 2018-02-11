class FavoriteMailer < ApplicationMailer
  default from: "emailreel@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@bloccit.example>"
    headers["References"] = "<post/#{post.id}@blocbloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(user, post)
    headers["In-Reply-To"] = "<post/#{post.id}@blocbloccit.example>"
    headers["References"] = "<post/#{post.id}@blocbloccit.example>"

    @user = user
    @post = post
    
    mail(to: user.email,
      subject: "Favorite Set for Post with Title: #{post.title}")
  end
end
