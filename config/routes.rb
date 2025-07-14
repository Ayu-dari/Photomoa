Rails.application.routes.draw do
  # Devise routes（ユーザー登録・ログイン関連）
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  # 投稿関連
  resources :posts, only: [ :new, :create, :index ]

  # マイページ（ログイン後のリダイレクト先）
  get "mypage", to: "users#mypage", as: "mypage"

  # ホーム画面
  get "home/top"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # トップページ
  root "home#top"
end
