FactoryGirl.define do
    factory :group, class: Group do
        sequence :id, &:to_s
        group_name { Faker::StarWars.planet }
        created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    end
end
