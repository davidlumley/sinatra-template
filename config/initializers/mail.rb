if ENV['RACK_ENV'] == 'production'
  Pony.options = {
    :from                 => 'noreply@example.com',
    :address              => 'smtp.sendgrid.net',
    :port                 => '587',
    :domain               => 'heroku.com',
    :user_name            => ENV['SENDGRID_USERNAME'],
    :password             => ENV['SENDGRID_PASSWORD'],
    :authentication       => :plain,
    :enable_starttls_auto => true
  }
else
  Pony.options = {
    :from        => 'noreply@example.com',
    :via         => :sendmail,
  }
end