FactoryGirl.define do
    factory :user do
        sequence :id, &:to_s
        nickname { Faker::StarWars.character }
        email { Faker::Internet.email }
        password              '00000000'
        password_confirmation '00000000'
        created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    end
end
