FactoryGirl.define do
  factory :user do
    name { Faker::Name.name  }
    email "foo@baz.com"
    password_digest "foobaz"
  end
end
