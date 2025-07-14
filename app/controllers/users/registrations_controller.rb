class Users::RegistrationsController < Devise::RegistrationsController
    protected

    # 新規登録後のリダイレクト先をマイページに設定
    def after_sign_up_path_for(resource)
      mypage_path
    end

    # もしメール認証などで未承認ならこちらも必要
    # def after_inactive_sign_up_path_for(resource)
    #   mypage_path
    # end
  end
