class Group < ActiveRecord::Base
  belongs_to :organization

  after_create :log_create

  def log_create
    Action.log(User.first, Action::Type::GROUP_CREATE, self, self.organization)
  end
end
