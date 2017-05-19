class CreateMyClients < ActiveRecord::Migration
  def change
    create_table :my_clients do |t|
      t.string :name, null: false
      t.string :details, null: false

      t.timestamps null: false
    end

    add_index :my_clients, :name, :unique => true

  end
end
