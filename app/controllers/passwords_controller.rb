class PasswordsController < Devise::PasswordsController
  
  def new
    super
  end

  def create
    super
    # self.resource = resource_class.send_reset_password_instructions(resource_params)
    # 
    # if successfully_sent?(resource)
    #   head :status => 200
    #   
    #   # respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
    # else
    #   respond_with(resource)
    # end
  end

  def edit
    super
  end
  
  def update
    # do for redirect
    # self.resource = resource_class.reset_password_by_token(resource_params)
    # 
    # if resource.errors.empty?
    #   flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
    #   set_flash_message(:notice, flash_message) if is_navigational_format?
    #   sign_in(resource_name, resource)
    #   respond_with resource, :location => after_sign_in_path_for(resource)
    # else
    #   respond_with resource
    # end
    super
  end
end