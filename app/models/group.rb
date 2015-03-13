class Group < ActiveRecord::Base
  belongs_to :organization
  has_many :memberships
  has_many :users, through: :memberships

  after_create :log_create
  after_create :make_current_user_member

  def make_current_user_member
    Membership.new(user: User.current_user, group: self).save()
  end

  def log_create
    Action.log(User.current_user, Action::Type::GROUP_CREATE, self, self.organization)
  end
end
