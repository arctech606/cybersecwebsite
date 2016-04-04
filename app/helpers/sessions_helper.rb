module SessionsHelper
  def log_in(faculty)
    session[:faculty_id] = faculty.id
  end
  def current_faculty
    @current_faculty ||= Faculty.find_by(id: session[:faculty_id])
  end
  def logged_in?
    !current_faculty.nil?
  end
  def log_out
    session.delete(:faculty_id)
    @current_faculty = nil
  end
end
