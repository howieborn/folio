module SessionsHelper
  
  def current_client=(client)
	@current_client = client
  end
  
  def current_client
    @current_client ||= client_from_remember_token 
  end
  
  def current_client?(client)
    client == current_client
  end

  def sign_in(client)
    cookies.permanent.signed[:remember_token] = [client.id, client.salt]
    self.current_client = client
  end
  
  def signed_in?
    !current_client.nil?
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_client = nil
  end
  
  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end




  private

    def client_from_remember_token
      client.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
	
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end
