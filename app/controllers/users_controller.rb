class UsersController < ApplicationController
  before_action :authenticate_user!  # ログイン済みかチェック

  def mypage
    @user = current_user
  end
end
