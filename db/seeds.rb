# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Menu.create(nama: "Nasi Goreng", deskripsi: "Nasi yang digoreng", harga: 10000)
Menu.create(nama: "Nasi Kotak", deskripsi: "Nasi didalam kotak", harga: 8000)
Menu.create(nama: "Nasi Lemak", deskripsi: "Nasi mengandung lemak", harga: 15000)

Kategori.create(nama: "Makanan")
Kategori.create(nama: "Minuman")
Kategori.create(nama: "Kue")

MenuKategori.create(menu_id: 1, kategori_id: 1)
MenuKategori.create(menu_id: 2, kategori_id: 1)
MenuKategori.create(menu_id: 3, kategori_id: 1)

Order.create(email: "daku1@gigih.com", status: "new")
Order.create(email: "daku2@gigih.com", status: "new")
Order.create(email: "daku3@gigih.com", status: "new")
Order.create(email: "daku4@gigih.com", status: "new")

OrderMenu.create(order_id: 1, menu_id: 1, porsi: 10, harga: 10000)
OrderMenu.create(order_id: 1, menu_id: 2, porsi: 30, harga: 90000)

OrderMenu.create(order_id: 2, menu_id: 1, porsi: 10, harga: 9000)
OrderMenu.create(order_id: 2, menu_id: 2, porsi: 30, harga: 10000)