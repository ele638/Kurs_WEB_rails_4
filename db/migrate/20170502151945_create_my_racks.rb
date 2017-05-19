class CreateMyRacks < ActiveRecord::Migration
  def change
    create_table :my_racks do |t|
      t.integer :number, null: false
      t.references :my_room, index: true, foreign_key: true, null: false
      t.integer :places, null: false
      t.float :height, null: false
      t.float :width, null: false
      t.float :length, null: false
      t.float :max_weight, null: false

      t.timestamps null: false
    end

    add_index :my_racks, [:my_room_id, :number], :unique => true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE my_racks ADD CONSTRAINT number_check CHECK (number > 0);
          ALTER TABLE my_racks ADD CONSTRAINT places_check CHECK (places > 0);
          ALTER TABLE my_racks ADD CONSTRAINT height_check CHECK (height > 0.0);
          ALTER TABLE my_racks ADD CONSTRAINT width_check CHECK (width > 0.0);
          ALTER TABLE my_racks ADD CONSTRAINT length_check CHECK (length > 0.0);
          ALTER TABLE my_racks ADD CONSTRAINT max_weight_check CHECK (max_weight > 0.0);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS number_check;
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS places_check;
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS height_check;
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS width_check;
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS length_check;
          ALTER TABLE my_racks DROP CONSTRAINT IF EXISTS max_weight_check;
        SQL
      end
    end

  end
end
