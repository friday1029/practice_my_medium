# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :check_recaptcha_v3, only: [:create]
  # GET /resource/sign_in
  def new
    @verify_v2 = params[:verify_v2] == "true"
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def check_recaptcha_v3
    valid_v3 = verify_recaptcha(
      action: 'login',
      minimum_score: 0.5,
      secret_key: ENV['RECAPTCHA_SECRET_KEY_V3']
    )
    valid_v2 = verify_recaptcha(secret_key: ENV['RECAPTCHA_SECRET_KEY_V2_CHECKBOX']) unless valid_v3

    if valid_v2 || valid_v3
      # 如果驗證成功要額外做什麼事...
    else
      redirect_to new_user_session_path(verify_v2: true)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
