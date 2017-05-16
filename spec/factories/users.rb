FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email "foo@baz.com"
    password "foobaz"
  end
end
