class FacultiesStudents < ActiveRecord::Migration
  def change
    create_table :faculties_students do |t|
      t.references :faculty
      t.references :student
    end
  end
  
end
