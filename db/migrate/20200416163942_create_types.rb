class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name, null: false
      t.boolean :status, default: false, null: false

      t.timestamps
    end
  end
end
