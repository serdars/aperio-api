require 'faker'

class User < ActiveRecord::Base
  after_create :log_create

  def log_create
    Action.log(self, Action::Type::JOIN_APERIO)
  end
end
