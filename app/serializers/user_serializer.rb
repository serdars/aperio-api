class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :organizations

  def organizations
    object.groups.map { |g|
      g.organization
    }.uniq.map { |o|
      OrganizationSerializer.new(o, root: nil)
    }
  end
end
