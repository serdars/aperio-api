class Group < ActiveRecord::Base
  belongs_to :organization
  has_many :memberships
  has_many :users, through: :memberships

  after_create :log_create

  def log_create
    Action.log(User.current_user, Action::Type::GROUP_CREATE, self, self.organization)
  end
end
