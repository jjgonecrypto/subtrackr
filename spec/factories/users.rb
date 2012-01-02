FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "user#{n}"}
    sequence(:email) {|n| "user#{n}@example.com"}
    password "123123"
    password_confirmation "123123"
  end
end 