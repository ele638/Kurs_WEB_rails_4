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

    add_index :my_items, [:my_rack_id, :position], :unique => true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE my_items ADD CONSTRAINT height_check CHECK (height > 0.0);
          ALTER TABLE my_items ADD CONSTRAINT width_check CHECK (width > 0.0);
          ALTER TABLE my_items ADD CONSTRAINT length_check CHECK (length > 0.0);
          ALTER TABLE my_items ADD CONSTRAINT position_check CHECK (position > 0);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE my_items DROP CONSTRAINT IF EXISTS height_check;
          ALTER TABLE my_items DROP CONSTRAINT IF EXISTS width_check;
          ALTER TABLE my_items DROP CONSTRAINT IF EXISTS length_check;
          ALTER TABLE my_items DROP CONSTRAINT IF EXISTS position_check;
        SQL
      end
    end

  end
end
