FactoryBot.define do
    factory :order_menu do
        association :order, factory: :order
        association :menu, factory: :menu
        porsi { Faker::Number.number }
        harga { Faker::Number.positive }
        total_harga { porsi * harga }
    end
end