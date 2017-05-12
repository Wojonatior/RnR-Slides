FactoryGirl.define do
  factory :content do |f|
    f.body { Faker::Lorem.sentence }
    slide
  end
end
