class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)

    if params[:tag_names].present?
      tag_names = params[:tag_names].split(/[、,]/).map(&:strip).uniq
      @post.tags = tag_names.map { |name| Tag.find_or_create_by(name: name) }
    end

    if @post.save
      redirect_to mypage_path, notice: "投稿が完了しました！"
    else
      flash.now[:alert] = "投稿に失敗しました。入力内容を確認してください。"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :location)
  end
end
