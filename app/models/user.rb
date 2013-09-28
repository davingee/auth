class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # config.token_authentication_key = :auth_token
  # before_save :ensure_authentication_token
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :location, :image
  # attr_accessible :title, :body
  has_many :user_authentications
  
  def apply_omniauth(auth)
    puts auth.inspect
    if auth.provider == "facebook"
      self.username           = auth.info.nickname
      self.email              = auth.info.email
      self.gender             = auth.extra.raw_info.gender
      self.first_name         = auth.info.first_name
      self.last_name          = auth.info.last_name
      self.location           = auth.info.location
      user_authentications.build(:provider => auth.provider, :uid => auth.uid, :oauth_token => auth.credentials.token, :oauth_expires_at => Time.at(auth.credentials.expires_at))
      binding.pry
    end
  end
    
  def name
    first_name.capitalize + " " + last_name.capitalize
  end

 
  def destroy_token!
    self.update_attribute(:authentication_token, "")
  end

  def reset_auth_token!
    self.update_attribute(:authentication_token, generate_authentication_token)
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.update_attribute(:authentication_token, generate_authentication_token)
    end
  end

  def password_required?
    (user_authentications.empty? || !password.blank?) && super
    # password.blank? && super
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    elsif params[:password].blank? 
      params.delete(:password) 
      params.delete(:password_confirmation) if params[:password_confirmation].blank? 
      update_attributes(params) 
    else 
      super
    end
  end

  private
  
  def generate_authentication_token
    loop do
      token = SecureRandom.hex
      break token unless User.where(:authentication_token => token).where(:id != 1).first
    end
  end

end
