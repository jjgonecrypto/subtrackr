FactoryGirl.define do
  factory :service do
    name ""
    url ""
    desc ""
    category ""
    schemes [ FactoryGirl.build(:scheme), FactoryGirl.build(:scheme)]
  end
end
