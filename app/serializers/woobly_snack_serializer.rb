class WooblySnackSerializer < ActiveModel::Serializer
  attributes :id
  has_one :woobly
  has_one :snack
end
