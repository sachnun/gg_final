class CreateMenuKategoris < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_kategoris do |t|
      t.belongs_to :menu
      t.belongs_to :kategori
      
      t.timestamps
    end
  end
end
