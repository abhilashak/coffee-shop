# Shop Items db table infos
class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name, limit: 60, null: false
      t.decimal :price, precision: 7, scale: 2, null: false
      t.decimal :tax,   precision: 7, scale: 2, null: false
      t.string  :category, limit: 50
      t.integer :free_with_item_id
      t.integer :discount_with_item_id
      t.decimal :discount_percentage, precision: 4, scale: 2

      t.timestamps
    end

    add_index :items, :category
    add_index :items, :free_with_item_id
    add_index :items, :discount_with_item_id
  end
end
