class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET /faculties
  # GET /faculties.json
  def index
    #@faculties = Faculty.all
    @faculties = Faculty.order(params[:name])
    @faculties = Faculty.search(params[:search])
    
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
    
  end
  
  def associate_student
    if session.key?(:faculty_id)
      @faculty=Faculty.find_by_id(session[:faculty_id])
      if @faculty == nil
        flash[:notice] = "You're not logged in"
        redirect_to uin_search_results_path
      else
      @student=Student.find_by_uin(session[:uin])
      @student1=@faculty.students.find_by_uin(session[:uin])
        if @student1 == nil
          @faculty.students << @student
        end
      session.delete(:uin)
      redirect_to faculty_path(@faculty)
      end
    else
      redirect_to error_display_path
    end
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
    if  !session.key?(:faculty_id)
      redirect_to error_display_path
    end
    @f=Faculty.find_by_name(params[:id])
    if @f.class==NilClass
     @f=Faculty.find_by_id(params[:id])
    end
    if session[:faculty_id] and session[:faculty_id]!=@f.id
      redirect_to error_display_path
    end
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)
    #@faculty.students << fu
    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    if session.key?(:faculty_id)
      respond_to do |format|
        if @faculty.update(faculty_params)
          format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
          format.json { render :show, status: :ok, location: @faculty }
        else
          format.html { render :edit }
          format.json { render json: @faculty.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to error_display_path
    end 
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def error_display
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:name, :dept, :desc,:email,:office,:phone_no,:password,:password_confirmation,:uin)
    end
end
