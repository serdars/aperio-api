def gen_random_user
  User.new(name: Faker::Name.name, email: Faker::Internet.email).save()
end

def gen_random_org
  o = Organization.new(name: Faker::Company.name, motto: Faker::Lorem.sentence)
  o.save()
  5.times do
    gen_random_group(org: o)
  end
end

def gen_random_group(org: nil)
  org ||= Organization.all.sample

  Group.new(
    name: Faker::Lorem.words(2).join(" "),
    motto: Faker::Lorem.sentence,
    organization: org
  ).save()
end

gen_random_user

5.times do
  gen_random_org
end
