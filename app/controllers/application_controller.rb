class ApplicationController < ActionController::Base
    ### before_action :authenticate_user!, only: :show
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :alert_any

  # before_action :set_current_user
  # def set_current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # end

  protected

  def configure_permitted_parameters
    # strong parametersを設定し、user_idを許可
    # devise_parameter_sanitizer.for(:sign_up){|u|
    #   u.permit(:user_id, :password, :password_confirmation)
    # }
    devise_parameter_sanitizer.permit(:sign_up){|u|
      u.permit(:user_id, :password,:email, :password_confirmation)
    }

    # devise_parameter_sanitizer.for(:sign_in){|u|
    #   u.permit(:user_id, :password, :remember_me)
    # }
    devise_parameter_sanitizer.permit(:sign_in){|u|
      u.permit(:user_id, :password,:email, :remember_me)
    }
  end

  def alert_any
    @company = Company.new
  end
    
end
