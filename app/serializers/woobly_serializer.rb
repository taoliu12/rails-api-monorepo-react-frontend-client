class WooblySerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  
  # has_one :user
  belongs_to :user

  has_many :snacks

end
