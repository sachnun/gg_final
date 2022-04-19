class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :nama, null: false, unique: true
      t.string :deskripsi
      t.float :harga, null: false, default: 0
      t.timestamps
    end
  end
end
