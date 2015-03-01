class Action < ActiveRecord::Base
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true
  belongs_to :related_to, polymorphic: true

  module Type
    JOIN_APERIO   = 0
    ORG_CREATE    = 0
    GROUP_CREATE  = 0
  end

  def self.log(subject, action_type, object = nil, related_to = nil)
    Action.new(
      subject: subject, action_type: action_type,
      object: object, related_to: related_to, read: false
    ).save()
  end
end
