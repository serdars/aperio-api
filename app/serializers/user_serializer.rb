class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :memberships, :organizations

  def memberships
    object.memberships.map do |m|
      m.group.id
    end
  end

  def organizations
    object.groups.map { |g|
      g.organization
    }.uniq.map { |o|
      OrganizationSerializer.new(o, root: nil)
    }
  end
end
