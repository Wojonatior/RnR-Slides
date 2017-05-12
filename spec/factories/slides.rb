FactoryGirl.define do
  factory :slide do |f|
    f.title { Faker::Lorem.word }
    f.slide_type "content"
    slideshow
  end
end
