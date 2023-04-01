class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_publisher!, :only => [:new, :create, :edit, :update, :destroy]
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    

    def after_sign_in_path_for(publishers)
        normal_pages_dashboard_path
    end
    def after_sign_out_path_for(publishers)
        root_path
    end

    protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :bio, :profile_picture, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :bio, :email, :profile_picture, :password, :current_password)}
          end
end
