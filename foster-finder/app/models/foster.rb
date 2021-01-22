class Foster < ActiveRecord::Base
    has_many :rescues
    has_many :users, through: :rescues
end 