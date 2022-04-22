FactoryBot.define do
    factory :order do
        email { Faker::Internet.email }
    end

    factory :invalid_order, parent: :order do
        email { nil }
    end
end