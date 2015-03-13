class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :groups

  def groups
    object.groups.map { |g|
      GroupSerializer.new(g, root: nil)
    }
  end
end
