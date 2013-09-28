OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "142709135935747", "3a00c62e18b0754195cce83253c5af31", :scope => "offline_access,email,publish_stream"
  # :facebook, ENV['FACEBOOK_APP_ID'] || APP_CONFIG[:facebook_key], ENV['facebook_secret'] || APP_CONFIG[:facebook_secret]
  
end
