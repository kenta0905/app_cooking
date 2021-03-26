class CreateCooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cooks do |t|

      t.string :title,            null: false 
      t.text   :catch_copy,       null: false
      t.integer :category_id,     null: false
      t.integer :cooktime_id,     null: false
      t.text   :material,         null: false
      t.text   :making,           null: false
      t.text   :point
      t.references :user,   foreign_key: true
      
      t.timestamps
    end
  end
end
