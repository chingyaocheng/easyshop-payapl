class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :ship_to_address
      t.string :phone_number
      t.string :ship_to_name
      t.string :ship_to_phone_number
      t.string :status
      t.string :customer_ip
      t.string :email

      t.timestamps null: false
    end
  end
end
