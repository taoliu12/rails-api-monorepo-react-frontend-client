class Woobly < ApplicationRecord
  belongs_to :user

  has_many :woobly_snacks
  has_many :snacks, through: :woobly_snacks

  
end
