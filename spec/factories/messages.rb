FactoryGirl.define do
  factory :message do
    sequence :id, &:to_s
    text { Faker::StarWars.wookie_sentence }
    image_url { Faker::File.file_name('path/to') }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    trait :nil_text do
      text ''
    end
  end
end
