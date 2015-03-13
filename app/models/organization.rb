class Organization < ActiveRecord::Base
  has_many :groups

  after_create :log_create
  after_create :create_default_groups

  def create_default_groups
    Group.new({
      name: "Members",
      motto: "All members",
      visible: true,
      private: false,
      organization: self
    }).save()

    Group.new({
      name: "Admins",
      motto: "Adminstrators",
      visible: false,
      private: true,
      organization: self
    }).save()
  end

  def log_create
    Action.log(User.current_user, Action::Type::ORG_CREATE, self)
  end
end
