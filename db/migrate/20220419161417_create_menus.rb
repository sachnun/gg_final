class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :nama, unique: true
      t.text :deskripsi
      t.integer :harga

      t.belongs_to :kategori, foreign_key: true, null: false

      t.timestamps
    end
  end
end
