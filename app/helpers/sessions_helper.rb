module SessionsHelper
  def log_in(faculty)
    session[:faculty_id] = faculty.id
  end
end
