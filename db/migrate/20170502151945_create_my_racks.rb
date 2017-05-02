class CreateMyRacks < ActiveRecord::Migration
  def change
    create_table :my_racks do |t|
      t.integer :number
      t.references :my_room, index: true, foreign_key: true
      t.integer :places
      t.float :height
      t.float :width
      t.float :length
      t.float :max_weight

      t.timestamps null: false
    end
  end
end
