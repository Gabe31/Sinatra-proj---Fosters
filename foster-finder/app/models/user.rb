class User < ActiveRecord::Base
    has_many :rescues
    has_many :fosters, through: :rescues
end