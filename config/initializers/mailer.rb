# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :smtp
 
ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "howieborn.com",
:user_name => 'howieborn@gmail.com',
:password => 'digger007',
:authentication => 'plain'
}
