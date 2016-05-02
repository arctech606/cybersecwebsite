class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.order(params[:name])
    if params[:search]
      @publications = Publication.search(params[:search])
    end
    if params[:params]
      if params[:params][:focus_area] != 'None'
        @publications=Publication.joins(:focusareas).where(focusareas:{name:params[:params][:focus_area]})
      end
      if params[:params][:cd_topic]
        if params[:params][:cd_topic] != 'None'
          @publications=Publication.joins(:cdtopics).where(cdtopics:{name:params[:params][:cd_topic]})
          if params[:search]
            @publications1=Publication.search(params[:search])
            @publications =@publications & @publications1
          end
        end
      end
      if params[:params][:publication_type] != 'None'
        @publications = Publication.where(:publication_type => params[:params][:publication_type])
      end
    end
  end
   
    # if params[:publication_type] !='None'
    #   @publications = Publication.where(:publication_type => params[:publication_type])
    # end
    # if params[:cd_topic] != 'None'
    #   @publications=Publication.joins(:cdtopics).where(cdtopics:{name:params[:cdtopics]})
    # end
    #respond_to do |format|
     # format.html # index.html.erb
    #  format.json { render json: @publications }
    #end
    #redirect_to publications_path
  
  def sort_by_name
   
  end
  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    @fac=Faculty.find(session[:faculty_id])
    @fac.publications << @publication
    @publication.faculties<< @fac
    if (params[:params][:cd_topic])
      if (params[:params][:cd_topic])!='None'
        Cdtopic.find_by_name(params[:params][:cd_topic]).publications << @publication
      end
    end
    if (params[:params][:focus_area])
      if (params[:params][:focus_area])!='None'
        Focusarea.find_by_name(params[:params][:focus_area]).publications << @publication
      end
    end
    respond_to do |format|
      if @publication.save
        format.html { redirect_to @publication, notice: 'Publication was successfully created.' }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'Publication was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'Publication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:name, :abstract, :keywords,:publication_type)
    end
end

