class SessionsController < ApplicationController
  def new
    @title = "Client Sign in"
	@heading = "Clients Only.."
  end

  def create
    client = Client.authenticate(params[:session][:name],
                             params[:session][:password])
    if client.nil?
      flash.now[:error] = "Invalid name/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in client
      redirect_back_or client
    end
  end


  def destroy
    sign_out
    redirect_to root_path
  end


end
