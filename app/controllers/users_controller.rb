class UsersController < ApplicationController
  before_action :authenticate_user!  # ログイン済みかチェック

  def mypage
    @user = current_user
    @posts = current_user.posts.order(created_at: :desc)
    @favorites = current_user.favorite_posts
  end

  def show
    @user = User.find(params[:id])
  end
end
