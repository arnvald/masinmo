# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Inmo::Application.initialize!

ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.raise_delivery_errors = true  
ActionMailer::Base.smtp_settings = { 
  :enable_starttls_auto => true,
  :address => 'inmo.megiteam.pl',
  :port => 25, 
  :user_name => 'inmo@inmo.megiteam.pl',
  :password => 'tuneup2011',
  :domain => 'inmo.megiteam.pl',
  :authentication => :login 
}
