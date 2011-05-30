class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :html, :xml, :json
  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = Post.all.includes(:user).collect{|p| p if p.comments.length > 10}.compact

    respond_with(@popular_posts)
  end

  def new
    @post = Post.new

    respond_with(@post)
  end

  def create
    @post = Post.new(params[:post])

    if @post.title.presence && @post.text.presence && @post.save
      redirect_to user_post_path(current_user,@post), :flash[:notice] = "Post has been created."
    else
      render new, :flash[:notice] = "Post has not been created."
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    
    respond_with(@comment)
  end

end

