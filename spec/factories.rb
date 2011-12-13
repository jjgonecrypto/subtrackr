Factory.define :user do |user|
  user.username "username"
end

Factory.define :subscription do |sub|
  sub.offset  15
  sub.days_before_notify 3
end
