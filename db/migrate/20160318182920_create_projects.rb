class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :sponsor
      t.text :desc
      t.references :faculty
      t.references :student
      t.timestamps null: false
    end
  end
end
