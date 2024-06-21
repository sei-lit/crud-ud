class CreateMedicines < ActiveRecord::Migration[6.1]
  def change
    create_table :medicines do |t|
      t.string :name, null: false
      t.integer :stock, null: false
      t.timestamps null:false
    end
  end
end
