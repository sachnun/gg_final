FactoryBot.define do
    factory :menu do
        nama { Faker::Food.unique.dish }
        deskripsi { Faker::Food.description[0..149] }
        harga { Faker::Number.positive }
        kategori { Kategori.first || association(:kategori) }
    end

    factory :invalid_menu, parent: :menu do
        nama { nil }
        deskripsi { nil }
        harga { 10_000.0 }
    end
end