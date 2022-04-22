FactoryBot.define do
    factory :kategori do
      nama { Faker::Food.ethnic_category }
    end

    factory :invalid_kategori, parent: :kategori do
        nama { nil }
    end
end