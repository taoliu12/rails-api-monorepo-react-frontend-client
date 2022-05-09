class Snack < ApplicationRecord

    has_many :woobly_snacks
    has_many :wooblies, through: :woobly_snacks
    

end
