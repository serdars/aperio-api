class Organization < ActiveRecord::Base
  has_many :groups

  after_create :log_create
  after_create :create_default_groups

  def admins_group
    # TODO: Find the first group created.
  end

  private
  def create_default_groups
    admin_group = Group.new({
      name: "Admins",
      motto: "Adminstrators",
      private: true,
      organization: self
    })
    admin_group.save()

    Membership.new(user: User.current_user, group: admin_group).save()
  end

  def log_create
    Action.log(User.current_user, Action::Type::ORG_CREATE, self)
  end
end
