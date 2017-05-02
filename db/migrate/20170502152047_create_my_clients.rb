class CreateMyClients < ActiveRecord::Migration
  def change
    create_table :my_clients do |t|
      t.string :name
      t.binary :details

      t.timestamps null: false
    end
  end
end
