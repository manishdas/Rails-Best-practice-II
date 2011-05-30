class User < ActiveRecord::Base
has_one :address
has_many :posts

acts_as_authentic

delegate :city, :country, :to => :address, allow_nil => true

end

