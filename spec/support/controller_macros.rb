module ControllerMacros
    
  def campaign_with_user(hash = { :role => :admin } )
    campaign = FactoryGirl.create(:campaign, :with_user)
    campaign.campaign_roles.first.update_attributes(:role => hash[:role])
    campaign
  end
  
  def set_basic_auth
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials 'angular', 'angular_secret'
    request.env['HTTP_AUTHORIZATION'] = credentials
  end

  def set_basic_auth_with_user(hash={})
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials 'angular', 'angular_secret'
    puts credentials
    
    request.env['HTTP_AUTHORIZATION'] = credentials
    user = hash[:with_omniauth] ? FactoryGirl.create(:user, :with_omniauth) : FactoryGirl.create(:user)
  end

  def set_token_auth_with_user(hash={})
    # user = hash[:with_omniauth] ? FactoryGirl.create(:user, :with_omniauth) : FactoryGirl.create(:user)
    if hash[:with_omniauth]
      user = FactoryGirl.create(:user, :with_omniauth)
    elsif hash[:with_credit_card]
      user = FactoryGirl.create(:user, :with_credit_card)
    elsif hash[:with_campaign]
      user = FactoryGirl.create(:user, :with_campaign)
    elsif hash[:with_geocoded]
      user = FactoryGirl.create(:user, :with_geocoded)
    else
      user = FactoryGirl.create(:user)
    end
    token = ActionController::HttpAuthentication::Token.encode_credentials(user.authentication_token)
    # angular ' Token token="u_pHzYF1u7bAAHZKGXKxPATA" '
    # puts user.authentication_token
    # puts token
    request.env['HTTP_AUTHORIZATION'] = token
    user
  end

  def set_token_auth_with_visitor(hash={})
    # user = hash[:with_omniauth] ? FactoryGirl.create(:user, :with_omniauth) : FactoryGirl.create(:user)
    if hash[:with_geocoded]
      visitor = FactoryGirl.create(:visitor, :with_geocoded)
    else
      visitor = FactoryGirl.create(:visitor)
    end
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(visitor.authentication_token)
    visitor
  end

  def set_token_auth(user)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.authentication_token)
  end

  def m(category, kind)
    I18n.translate "#{category}.#{kind}"  
  end

  # # Controllers don't need to concern themselves with authorization
  # # since we test that all seperately.
  # def authorize
  #   before(:each) do
  #     @ability = Object.new.tap {|o| o.extend CanCan::Ability}
  #     @ability.can :manage, :all
  #     @controller.stub(:current_ability) { @ability }
  #   end
  # end
  # 
  # def authorize_and_login
  #   authorize
  #   login
  # end
  
end
