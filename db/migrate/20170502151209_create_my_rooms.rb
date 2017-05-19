class CreateMyRooms < ActiveRecord::Migration
  def change
    create_table :my_rooms do |t|
      t.string :name, null: false
      t.float :volume, null: false

      t.timestamps null: false
    end

    add_index :my_rooms, :name, :unique => true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE my_rooms
            ADD CONSTRAINT volume_check
            CHECK (volume > 0.0);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE my_rooms
            DROP CONSTRAINT IF EXISTS volume_check;
        SQL
      end
    end
  end
end
