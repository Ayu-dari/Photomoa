require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(email: "test@example.com", password: "password", name: "テストユーザー")
  end

  test "should get mypage" do
    sign_in_as(@user)  # ← ログイン処理
    get mypage_url
    assert_response :success
  end

  private

  # ログインヘルパー（テスト用）
  def sign_in_as(user)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: "password"
      }
    }
  end
end
