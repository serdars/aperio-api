class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships

  acts_as_authentic do |c|
    c.login_field = 'name'
  end

  after_create :log_create

  def log_create
    Action.log(self, Action::Type::JOIN_APERIO)
  end
end
