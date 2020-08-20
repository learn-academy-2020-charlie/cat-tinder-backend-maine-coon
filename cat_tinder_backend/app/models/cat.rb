class Cat < ApplicationRecord
    validates :name, :age, :enjoys, presence:true
    validates :age, 
end
