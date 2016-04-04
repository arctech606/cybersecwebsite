class SessionsController < ApplicationController
  def new
  end
  def create
    faculty = Faculty.find_by_email(params[:session][:email])
    if faculty && faculty.authenticate(params[:session][:password])
      #will successfully log the faculty in
      log_in faculty
      redirect_to faculty_path(faculty.id)
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
