class CreateFields < ActiveRecord::Migration[7.0]
    def change
      create_table :fields, id: false do |t|
        t.integer :field_id, primary_key: true
        t.string :field_name
        t.string :field_alias
        t.boolean :field_used
        t.boolean :field_many
      end
    end
  end
  