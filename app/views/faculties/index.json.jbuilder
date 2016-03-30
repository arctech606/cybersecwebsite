json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :dept, :desc, :office, :phone_no, :email
  json.url faculty_url(faculty, format: :json)
end
