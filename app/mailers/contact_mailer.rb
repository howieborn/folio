class ContactMailer < ActionMailer::Base
  default :to => "howieborn@gmail.com"

  def send_message(contact)
	@contact = contact
	mail(:from => contact.email, 
	     :subject => "Message from #{contact.email} - Howie Born")
  end	
end
