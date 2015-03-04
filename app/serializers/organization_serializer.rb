class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :motto, :groups

  def groups
    puts "org serialize"
    object.groups.map { |g|
      GroupSerializer.new(g, root: nil)
    }
  end
end
