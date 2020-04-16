class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :type_id
      t.string :name
      t.text :explanation
      t.integer :excluded
      t.string :image
      t.integer :status

      t.timestamps
    end
  end
end
