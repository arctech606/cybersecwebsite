class FacultiesStudents < ActiveRecord::Migration
  def change
    create_table :faculties_students, id: false do |t|
      t.belongs_to :faculty, index: true
      t.belongs_to :student, index: true
    end
  end
end
