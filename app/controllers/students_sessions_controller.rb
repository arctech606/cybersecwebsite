class StudentsSessionsController < ApplicationController
  def new
  end
  def create
    student = Student.find_by_email(params[:session][:email])
    if student && student.authenticate(params[:session][:password])
      #will successfully log the student in
      student_log_in student
      params[:session][:remember_me] == '1' ? remember(student) : forget(student)
      redirect_to student_path(student.id)
    else
      flash.now[:danger] = 'Invalid email/password combination' # right!
      render 'new'
    end
  end
  def destroy
    student_log_out if student_logged_in?
    redirect_to root_url
  end
end