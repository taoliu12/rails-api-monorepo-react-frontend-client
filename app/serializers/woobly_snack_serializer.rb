class WooblySnackSerializer < ActiveModel::Serializer
  attributes :id, :price

  has_one :woobly
  has_one :snack

end
