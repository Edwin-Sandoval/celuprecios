class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :setbrands
  before_action :setadvertisements
  before_filter :allow_iframe_requests

  

  protected
  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:photo,:city,:celular,:facebook])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:photo,:city,:celular,:facebook])
  end
  
  def authenticate_admin_user!
    redirect_to root_path unless user_signed_in? && current_user.is_admin_user?
  end
  def authenticate_normal_user!
    redirect_to root_path unless user_signed_in?
  end
  private
	
  def setbrands
  	@brands = Brand.all.reorder('name DESC')
  end
  def setadvertisements
    @advertisementsprincipal = Advertisement.where("state != 'inavilitado'")
  end
end