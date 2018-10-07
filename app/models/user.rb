class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:saml]

  # Lookup for user matching authentication data from ADFS
  # More info: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
  def self.from_omniauth(auth)
    Rails.logger.info("Trying to find user: uid #{auth.uid}, provider: #{auth.provider}")
    where(provider: auth.provider, uid: auth.uid).
        first_or_create(email: auth.uid, provider: auth.provider, uid: auth.uid, password: generate_password)
  end

  private

  def self.generate_password
    Devise.friendly_token.first(10)
  end
end
