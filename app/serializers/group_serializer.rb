class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :private, :is_member
end
