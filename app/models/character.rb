class Character < ApplicationRecord
    validates :name, :animal, :enjoys, :personality, presence: true
    validates :enjoys, length: { minimum: 10 }
   

end
