class RegistrationsController < Devise::RegistrationsController

  def update_resource(resource, user_params)
    resource.update_without_password(user_params)
  end
    protected
  
    def update_resource(resource, user_params)
      resource.update_without_password(user_params)
    end
  end