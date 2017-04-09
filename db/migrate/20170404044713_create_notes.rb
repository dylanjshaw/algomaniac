class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :content, null: false
      t.integer :user_id
      t.boolean :is_trash
      t.timestamps
    end
  end
end
