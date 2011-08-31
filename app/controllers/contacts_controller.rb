class ContactsController < ApplicationController

  def new
    @contact = Contact.new(:id => 1)
  end
	
    def create  
      @contact = Contact.new(params[:contact])  
      
      respond_to do |format|  
        if @contact.save  
          ContactMailer.send_message(@contact).deliver  
          format.html { redirect_to(root_path, :notice => 'Your Message was successfully sent') }  
          format.xml  { render :xml => @contact, :status => :created, :location => @contact }  
        else  
	  flash.now.alert = "Please Fill All Fields"
          format.html { render :action => "new" }  
          format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }  
        end  
      end  
    end  

end
