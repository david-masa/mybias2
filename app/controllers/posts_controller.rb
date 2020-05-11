class PostsController < ApplicationController
  before_action :set_genre

  def index
    @post = Post.new
    @posts = @genre.posts.includes(:user)
  end

  def create
    @post = @genre.posts.new(post_params)
    
    if @post.save
      redirect_to genre_posts_path(@genre), notice: 'メッセージが送信されました'
    else
      @posts = @genre.posts.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
end
