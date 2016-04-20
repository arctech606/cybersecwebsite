class AddCourseCategoryToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :course_category, :string
  end
end
