class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.integer :total_price, null: false
      t.string :name, null: false
      t.string :post_number, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :payment, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.timestamps
    end
  end
end
