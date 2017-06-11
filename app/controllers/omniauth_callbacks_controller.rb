class OmniauthCallbacksController < ApplicationController
  def twitter
    logger.info "callback!!!!"
    @oauth_user = OauthUser.from_omniauth(request.env["omniauth.auth"].except("extra"))

    if @oauth_user.persisted?
      sign_in_and_redirect @oauth_user
    else
      session["devise.user_attributes"] = @oauth_user.attributes
      redirect_to new_oauth_user_registration_url
    end
  end
end
