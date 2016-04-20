class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :courses_offered
      t.string :course_number
      t.string :semester_offered
      t.timestamps null: false
    end
  end
end
