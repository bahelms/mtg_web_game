class RegistrationsController < Devise::RegistrationsController
  protected
    def after_update_path_for(resource)
      # This changes the default redirect after editing account
      user_path(resource)
    end
end
