class CreateGroups < ActiveRecord::Migration[7.0]
    def change
      create_table :groups, id: false do |t|
        t.integer :group_id, primary_key: true
        t.string :group_name
      end
    end
  end
  