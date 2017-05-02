class CreateMyItems < ActiveRecord::Migration
  def change
    create_table :my_items do |t|
      t.float :height
      t.float :width
      t.float :length
      t.float :weight
      t.date :incoming_date
      t.references :my_client, index: true, foreign_key: true
      t.date :issue_date
      t.references :my_rack, index: true, foreign_key: true
      t.integer :position

      t.timestamps null: false
    end
  end
end
