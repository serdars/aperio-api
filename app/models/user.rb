class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships

  def self.set_current_user(user)
    @current_user = user
  end

  def self.current_user
    @current_user
  end

  acts_as_authentic do |c|
    c.login_field = 'name'
  end

  after_create :log_create

  def log_create
    Action.log(self, Action::Type::JOIN_APERIO)
  end
end
