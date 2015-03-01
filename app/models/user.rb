require 'faker'

class User < ActiveRecord::Base
  after_create :log_create

  def self.gen_random_org
    o = Organization.new(name: Faker::Company.name, motto: Faker::Lorem.sentence)
    o.save()
    5.times do
      self.gen_random_group(org: o)
    end
  end

  def self.gen_random_group(org: nil)
    org ||= Organization.all.sample

    Group.new(
      name: Faker::Lorem.words(2).join(" "),
      motto: Faker::Lorem.sentence,
      organization: org
    ).save()
  end

  def log_create
    Action.log(self, Action::Type::JOIN_APERIO)
  end
end
