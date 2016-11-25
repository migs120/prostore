class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  #filter_parameter_logging :card_number, :card_verification
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :admin
   helper_method :current_order
   rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end
  
 
def admin
         if current_user && current_user.role == "admin"
         $admin = true
      else 
         $admin = false
       end
end
 
 def params_info
   params
 end
  
  def current_order
    #if !Order.where(id: session[:order_id]) == nil && !session[:order_id].nil?
    if !session[:order_id].nil?
      #if Order.where(id: Order.find(session[:order_id]).id)
      Order.find(session[:order_id])
      #end
    
    else
      Order.create()
    end
  end
 
   protected
 
   def configure_permitted_parameters
     #devise_parameter_sanitizer.for(:sign_up) << :name
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
     devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit( :name, :email, :password) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
   end
end