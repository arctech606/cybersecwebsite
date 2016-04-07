module StudentsSessionsHelper
def student_log_in(student)
    session[:student_id] = student.id
  end
  
  def current_student
    if (student_id = session[:student_id])
      @current_student ||= student.find_by(id: student_id)
    elsif (student_id = cookies.signed[:student_id])
      student = student.find_by(id: student_id)
      if student && student.authenticated?(cookies[:remember_token])
        student_log_in student
        @current_student = student
      end
    end
  end
  
  def student_logged_in?
    !current_student.nil?
  end
  
  
  def remember(student)
    remember
    cookies.permanent.signed[:student_id] = student.id
    cookies.permanent[:remember_token] = remember_token
  end
  
  def forget(student)
    forget
    cookies.delete(:student_id)
    cookies.delete(:remember_token)
  end
  
  def log_out
    forget(current_student)
    session.delete(:student_id)
    @current_student = nil
  end
end
