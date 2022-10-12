class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  include Items
end
