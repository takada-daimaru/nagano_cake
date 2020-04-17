class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_cost, null: false, default: 800
      t.integer :payment, null: false
      t.integer :status, null: false, default: 0
      t.string :postcode, null: false
      t.text :address, null: false
      t.string :destination, null: false
      t.integer :invoice, null: false

      t.timestamps
    end
  end
end
