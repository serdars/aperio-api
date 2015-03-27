class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :invitee_id, :state, :inviter, :organization

  def organization
    {
      id: object.organization.id,
      name: object.organization.name
    }
  end

  def inviter
    {
      id: object.inviter.id,
      name: object.inviter.name
    }
  end
end
