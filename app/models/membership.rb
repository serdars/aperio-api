class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  after_create :log_create

  def log_create
    Action.log(self.user, Action::Type::GROUP_JOIN, self.group, self.group.organization)
  end
end
