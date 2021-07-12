# Shop Orders db table infos
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total, precision: 9, scale: 2, null: false
      t.string  :status, limit: 20, default: 'pending'

      t.timestamps
    end
  end
end
