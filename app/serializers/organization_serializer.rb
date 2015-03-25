class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :groups, :is_member, :is_admin

  def groups
    object.groups.map { |g|
      GroupSerializer.new(g, root: nil)
    }
  end
end
