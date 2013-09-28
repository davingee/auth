class AuthenticationsController < ApplicationController

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = UserAuthentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication && authentication.user.present?
      authentication.user.reset_auth_token!
      flash[:notice] = "Signed in successfully."
      sign_in(:user, authentication.user)
      authentication.user.reset_authentication_token!
      redirect_to root_path
    # elsif current_user
    #   create_authentication(omniauth, current_user)
    #   flash[:notice] = "Authentication successful."
    #   redirect_or_go_to("be_a_ninja")
    # elsif user = User.find_by_email(omniauth.info.email)
    #   create_authentication(omniauth, user)
    #   flash[:notice] = "Authentication successful."
    #   redirect_or_go_to("welcome", authentication.user)
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        user.reset_auth_token!
        flash[:notice] = "Signed in successfully."
        redirect_to root_path
        # Emailer.welcome(current_user).deliver if current_user.sign_in_count < 2
      else
        # store_omniauth_session(omniauth, user)
        redirect_to new_user_registration_url
      end
    end

      # user = User.from_omniauth(env["omniauth.auth"])
      # session[:user_id] = user.id
      # redirect_to root_url
    #   render env["omniauth.auth"]
    # end
  end

end


