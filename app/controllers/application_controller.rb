class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :avatar ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :avatar ])
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def after_sign_up_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # ログイン後の遷移先をマイページに変更
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインしました。"
    mypage_path  # トップページ → マイページ に変更
  end
end
