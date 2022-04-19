class CreateOrderMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :order_menus do |t|
      t.belongs_to :order
      t.belongs_to :menu

      t.integer :porsi, null: false
      t.decimal :harga, null: false

      t.timestamps
    end
  end
end
