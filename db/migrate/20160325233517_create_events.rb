class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :desc
      t.text :venue

      t.timestamps null: false
    end
  end
end
