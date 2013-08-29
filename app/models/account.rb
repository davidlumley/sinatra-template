module SinatraApp
  class Account
    include DataMapper::Resource

    property :id,         Serial
    property :created_at, DateTime
    property :updated_at, DateTime

    property :name,       String,  :required => true, :length => 255

    has n,   :users, :through => Resource

    def to_slug
      self.name.strip.gsub(' ', '_')
    end
  end
end