class CreateMyRooms < ActiveRecord::Migration
  def change
    create_table :my_rooms do |t|
      t.string :name
      t.float :volume

      t.timestamps null: false
    end
  end
end
