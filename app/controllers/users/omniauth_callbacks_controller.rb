# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:saml, :failure]

  def saml
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user
      # TODO: ADFS Fix for Idp Initiated logout (verify if it is really needed with lastest omniauth version)
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'ADFS SSO') if is_navigational_format?
    else
      failure
    end
  end

  def failure
    redirect_to root_path
  end
end
