module SinatraApp
  class User
    include DataMapper::Resource

    property :id,         Serial
    property :created_at, DateTime
    property :updated_at, DateTime

    property :email,      String,     :required => true, :unique => true, :index => true, :format => :email_address
    property :password,   BCryptHash, :required => true

    has n,   :accounts, :through => Resource

    def self.authenticate(email, password)
      return nil unless (user = User.first(:email => email)) && user.password == password
      user
    end
  end
end