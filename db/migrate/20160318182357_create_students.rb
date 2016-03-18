class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :dept
      t.text :desc
      t.references :faculty
      t.timestamps null: false
    end
  end
end
