class Rescue < ActiveRecord::Base
    belongs_to :users
    belongs_to :fosters
end