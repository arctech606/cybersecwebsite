class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include StudentsSessionsHelper

  helper_method :current_user

  private
  def current_user
  @current_user ||= Faculty.find(session[:faculty_id]) if session[:faculty_id]
  rescue ActiveRecord::RecordNotFound
    session[:faculty_id] = nil
  end
  
  def current_student_user
  @current_student_user ||= Student.find(session[:student_id]) if session[:student_id]
  rescue ActiveRecord::RecordNotFound
    session[:student_id] = nil
  end
end