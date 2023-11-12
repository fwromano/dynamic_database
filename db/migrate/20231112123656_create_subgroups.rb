class CreateSubgroups < ActiveRecord::Migration[7.0]
    def change
      create_table :subgroups, id: false do |t|
        t.integer :subgroup_id, primary_key: true
        t.text :subgroup_name
      end
    end
  end
  