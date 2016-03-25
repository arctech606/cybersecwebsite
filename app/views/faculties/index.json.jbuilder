json.array!(@faculties) do |faculty|
  json.extract! faculty, :id, :name, :dept, :desc
  json.url faculty_url(faculty, format: :json)
end
