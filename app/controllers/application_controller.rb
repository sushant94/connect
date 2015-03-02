class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # initializeCall must be called exactly once,
  # at the beginning of the initialization of the application.
  # Repeated calls to this function must be avoided as
  # the database queries will be quite costly.
  def home
    if !current_user
      redirect_to :new_user_session
    else
      redirect_to '/post/dashboard'
    end
  end

  def initializeCall
      posts = Post.all
      tags = Tag.all
      authors = Author.all
      clubs = Club.all

      news = {
          post: posts,
          tags: tags,
          authors: authors,
          clubs: clubs
      }

      render json: news
  end

end

