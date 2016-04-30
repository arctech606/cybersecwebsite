class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    #@student = Student.all
    @student = Student.order(params[:name])
    @student = Student.search(params[:search])
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end
  def students_error_display
  end
  
  def uin
    
  end
  def uin_search_results
    uid=params[:uin]
    @student=Student.find_by_uin(uid)
    if @student == nil
      flash[:notice] = "No student with the UIN found"
      redirect_to uin_path
    end
    session[:uin] = uid
  end
  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    if  !session.key?(:student_id)
      redirect_to students_error_display_path
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :dept, :desc,:email,:password,:password_confirmation,:uin)
    end
end