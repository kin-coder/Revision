class ApplicationController < ActionController::Base
        add_flash_types :danger, :success, :warning, :info
        before_action :configure_permitted_parameters, if: :devise_controller?

        protected
      
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :name])
        end
      

end
