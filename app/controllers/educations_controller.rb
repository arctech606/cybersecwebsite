class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  def index
    @educations = Education.all
  end
  def show
  end
  def new
    @education = Education.new
  end
  def edit
  end
  def create
    @education = Education.new(education_params)
    respond_to do |format|
      if @education.save
        format.html { redirect_to @education, notice: 'Education was successfully created.' }
        format.json { render :show, status: :created, location: @education }
      else
        format.html { render :new }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_education
      @education = Education.friendly.find(params[:id])
    end
    def education_params
      params.require(:education).permit(:courses_offered, :course_number, :semester_offered, :course_category)
    end
end
