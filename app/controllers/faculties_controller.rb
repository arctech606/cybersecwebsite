class FacultiesController < ApplicationController
  before_action :set_faculty, only: [:show, :edit, :update, :destroy]

  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
  end
  
  def associate_student
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
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
  end

  # GET /faculties/1/edit
  def edit
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
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
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
  
  def upload_resume
    
      @faculty=Faculty.find(session[:faculty_id])
    
      # Install this the SDK with "gem install dropbox-sdk"
      
      require 'dropbox_sdk'
      
      # Get your app key and secret from the Dropbox developer website
      app_key = 'x39lzlcnmtz8ty3'
      app_secret = '0gss5d1oko1vk4t'
      
      flow = DropboxOAuth2FlowNoRedirect.new(app_key, app_secret)
     
      access_token='FEjVVhOXMHIAAAAAAAAAIaNk3xr2kuVHOQL67dy_yMCBS0aoR8CXAGw7lW8CRy9a'
      
      client = DropboxClient.new(access_token)
     
      file = open(params[:cv_path])
      resume_name='/'+ @faculty.name+'_resume'
      response = client.put_file(resume_name, file)
      
      if response!=NIL
        @upload_complete='Successful'
      else
         @upload_complete='failed'
      end
  end    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:name, :dept, :desc,:email,:office,:phone_no,:password,:password_confirmation)
    end
end
