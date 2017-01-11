FactoryGirl.define do
    factory :message do
        text 'hello!'
        image_url 'hoge.png'
        user_id 1
        group_id 1
        created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    end
end
