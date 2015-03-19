class Organization < ActiveRecord::Base
  has_many :groups

  after_create :log_create
  after_create :create_default_groups

  def all_members_group
    self.groups.where(system: "all_members").first
  end

  def admins_group
    self.groups.where(system: "admins").first
  end

  private
  def create_default_groups
    Group.new({
      name: "Members",
      motto: "All members",
      visible: true,
      private: false,
      organization: self,
      system: "all_members"
    }).save()

    Group.new({
      name: "Admins",
      motto: "Adminstrators",
      visible: false,
      private: true,
      organization: self,
      system: "admins"
    }).save()
  end

  def log_create
    Action.log(User.current_user, Action::Type::ORG_CREATE, self)
  end
end
