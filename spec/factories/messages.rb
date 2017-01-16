FactoryGirl.define do
    factory :message do
        sequence :id, &:to_s
        text 'hello!'
        image_url 'hoge.png'  
        created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
    end
end
