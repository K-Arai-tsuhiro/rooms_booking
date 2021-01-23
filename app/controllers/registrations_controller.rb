class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: %i(create)
  before_action :configure_account_update_params, only: %i(update)
  
  def create
    super
    
    resource.build_profile
    resource.profile.user_id = resource.id
    resource.profile.profile_photo = ""
    resource.profile.introduction = ""
    resource.save
  end
  
  protected
  
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end 
  
  def after_sign_up_path_for(resource)
    edit_profile_path(resource)
  end

  def after_update_path_for(resource)
    user_path(resource)
  end 
  
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name email))
  end 
  
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name email))
  end
  
end