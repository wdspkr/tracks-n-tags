FactoryGirl.define do
  factory :track do
    sequence(:url) { |n| "http://#{n}.example.com" }
  end
end
