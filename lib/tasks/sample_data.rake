require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = Client.create!(:name => "Admin User",
                         :email => "admin@somedomain.com",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
	Client.create!(:name => "Example User",
					:email => "example@somedomain.com",
					:password => "foobar",
					:password_confirmation => "foobar")				
	20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@somedomain.org"
      password  = "password"
      Client.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
