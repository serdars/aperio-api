class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User", foreign_key: 'inviter_id'
  belongs_to :invitee, class_name: "User", foreign_key: 'invitee_id'
  belongs_to :organization

  enum state: [ :waiting, :declined, :accepted ]

  after_create :log_create

  def log_create
    Action.log(User.current_user, Action::Type::INVITE, self.organization)
  end
end
