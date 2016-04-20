class CreateStudents < ActiveRecord::Migration
   
  def change
    create_table :students do |t|
      t.string :name
      t.string :dept
      t.text :desc
      t.timestamps null: false
      t.references :research_interest
      t.references :project
      t.references :publication
    end
  end
end
