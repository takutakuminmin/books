class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(20)
  end

  def new
    @post = Post.new
    @like = Like.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "ゲスト"
      user.profile = "7つの習慣、シン・ニホン、サピエンス全史、サーチインサイドユアセルフ"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private
  def post_params
    params.require(:post).permit(:image, :title, :page, :line, :content).merge(user_id: current_user.id)
  end
end