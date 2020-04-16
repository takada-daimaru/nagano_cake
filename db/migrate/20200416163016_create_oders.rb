class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :payment
      t.integer :status
      t.string :postcode
      t.text :address
      t.string :destination
      t.integer :invoice

      t.timestamps
    end
  end
end
