class CreateData < ActiveRecord::Migration[7.0]
    def change
      create_table :data, id: false do |t|
        t.integer :data_id, primary_key: true
        t.integer :group_id
        t.integer :subgroup_id
        t.integer :field_id
        t.string :data_value
  
        t.index :group_id, unique: true
        t.index :subgroup_id, unique: true
        t.index :field_id, unique: true
      end
    end
  end
  