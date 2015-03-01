class Organization < ActiveRecord::Base
  has_many :groups

  after_create :log_create

  def log_create
    Action.log(User.first, Action::Type::ORG_CREATE, self)
  end
end
