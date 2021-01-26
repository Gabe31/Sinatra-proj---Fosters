class User < ActiveRecord::Base
     has_many :fosters

     has_secure_password


    validates :username, uniqueness: true
    validates :username, presence: true



end