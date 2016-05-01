class CreateFocusareas < ActiveRecord::Migration
  def change
    create_table :focusareas do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
