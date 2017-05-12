FactoryGirl.define do
  factory :slideshow do |f|
    f.title { Faker::Lorem.word }

    factory :slideshow_with_slides do
      transient do 
        slides_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:slide, evaluator.slides_count, slideshow: slideshow)
      end
    end
  end
end
