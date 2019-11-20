class User < ApplicationRecord
    #Here is the new line of code
    validates :name, presence: true
end
