json.array!(@educations) do |education|
  json.extract! education, :id, :courses_offered, :course_number, :semester_offered
  json.url education_url(education, format: :json)
end
