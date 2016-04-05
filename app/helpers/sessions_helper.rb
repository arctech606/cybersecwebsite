module SessionsHelper
  def log_in(faculty)
    session[:faculty_id] = faculty.id
  end
  
  def current_faculty
    if (faculty_id = session[:faculty_id])
      @current_faculty ||= Faculty.find_by(id: faculty_id)
    elsif (faculty_id = cookies.signed[:faculty_id])
      faculty = Faculty.find_by(id: faculty_id)
      if faculty && faculty.authenticated?(cookies[:remember_token])
        log_in faculty
        @current_faculty = faculty
      end
    end
  end
  
  def logged_in?
    !current_faculty.nil?
  end
  
  
  def remember(faculty)
    faculty.remember
    cookies.permanent.signed[:faculty_id] = faculty.id
    cookies.permanent[:remember_token] = faculty.remember_token
  end
  
  def forget(faculty)
    faculty.forget
    cookies.delete(:faculty_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_faculty)
    session.delete(:faculty_id)
    @current_faculty = nil
  end

end
