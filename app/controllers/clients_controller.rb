class ClientsController < ApplicationController
  before_filter :authenticate, :only => []
  before_filter :correct_client, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:destroy, :index ]

  def show
    @client = Client.find(params[:id])
	@heading = @client.name
    #@microposts = @client.microposts.paginate(:page => params[:page])
    
  end
  
  def index
    @heading = "All Clients"
    @client = Client.paginate(:page => params[:page]) # = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
	  sign_in @client
	  flash[:success] = "New Client has been added to the database"
      redirect_to @client # Handle a successful save.
     else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit Client"
  end
  
  def update
    if @client.update_attributes(params[:client])
      flash[:success] = "Client Profile Updated."
      redirect_to @client
    else
      @title = "Edit Client"
      render 'edit'
    end
  end


  private


    def correct_client
      @client = Client.find(params[:id])
      redirect_to(root_path) unless current_client?(@client)
    end
	
	def admin_user
	  @client = Client.find(params[:id])
      redirect_to(root_path) unless current_client.admin?
    end


	def destroy
	  Client.find(params[:id]).destroy
      flash[:success] = "Client destroyed."
      redirect_to clients_path
    end
end
