class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :private, :visible
end
