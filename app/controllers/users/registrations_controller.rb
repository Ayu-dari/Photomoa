class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # 新規登録後のリダイレクト先をマイページに設定
    def after_sign_up_path_for(resource)
      mypage_path
    end

    # Strong Parametersに:termsを追加
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :terms ])
    end
end
