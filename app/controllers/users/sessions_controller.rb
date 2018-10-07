# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def destroy
    # Preserve the saml_uid in the session
    saml_uid = session["saml_uid"]
    super do
      session["saml_uid"] = saml_uid
    end
  end

  def after_sign_out_path_for(_)
    # if session['saml_uid'] && SAML_SETTINGS.idp_slo_target_url
    if session['saml_uid'] && Devise.omniauth_configs[:saml].options[:idp_slo_target_url]
      user_saml_omniauth_authorize_path + "/spslo"
    else
      super
    end
  end

end
