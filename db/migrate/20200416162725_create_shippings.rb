class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.integer :customer_id
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
