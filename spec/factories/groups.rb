FactoryGirl.define do
    factory :group, class: Group do
        sequence :id, &:to_s
        sequence :group_name do |n|
            "group_name#{n}"
        end

        trait :association_message do
            association :message, factory: :message
        end
    end
end
