class Education < ActiveRecord::Base
validates :courses_offered, :course_number, :semester_offered, presence: { :message => "data not present" }
end
