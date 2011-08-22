class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  def send_mail
    Notifier.deliver_contactme(params[:email])
    flash[:notice] = "Email was sent successfully."
    redirect_to contact_path
  end  
  
end
