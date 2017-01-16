FactoryGirl.define do
    factory :user do
        sequence :id, &:to_s
        sequence :nickname do |n|
            "nickname#{n}"
        end
        email 'XXXX@XXXX.com'
        password              '00000000'
        password_confirmation '00000000'
    end
end
