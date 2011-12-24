FactoryGirl.define do
  factory :user do
    username { Factory.next :username }
    email  { Factory.next :email }
    password "123123"
  end
  sequence :email do |n|
    "user#{n}@example.com"
  end
  sequence :username do |n|
    "user#{n}"
  end
end