# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

3.times do
    FactoryBot.create(:kategori)
end

10.times do
    FactoryBot.create(:menu, kategori: Kategori.order("RANDOM()").first)
end

5.times do
    FactoryBot.create(:order)
end

20.times do
    FactoryBot.create(:order_menu, order: Order.order("RANDOM()").first)
end