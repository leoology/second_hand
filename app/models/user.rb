class User <ActiveRecord::Base
    has_secure_password
    has_many :listings
    has_many :comments
    

#    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
 #   validates :password, confirmation: true, length: {in: 10..100}, exclusion: {in: ["password","0123456789"]} 
end