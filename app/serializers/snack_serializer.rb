class SnackSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :wooblies
end
