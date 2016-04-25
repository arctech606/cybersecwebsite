class Education < ActiveRecord::Base
validates :courses_offered, :course_number, :semester_offered, :course_category, presence: { :message => "data not present" }
  extend FriendlyId
  friendly_id :courses_offered
end
