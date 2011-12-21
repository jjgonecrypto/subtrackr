Factory.define :user do |user|
  user.username { Factory.next :username }
  user.email  { Factory.next :email }
  user.password "123123"
end
Factory.sequence :email do |n|
  "user#{n}@example.com"
end
Factory.sequence :username do |n|
  "user#{n}"
end