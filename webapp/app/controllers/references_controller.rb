class ReferencesController < ApplicationController
  before_action :authenticate_user
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound do
    redirect_to projects_path
  end

  # GET /references
  # GET /references.json
  def index
    if params[:pid].blank?
      redirect_to projects_path
    else
      @project = Project.where(:id => params[:pid]).where(:user_id => current_user.id).first
      if @project.blank?
        redirect_to projects_path
      else
        @references = @project.references
        enter_project @project
      end
    end
  end

  # GET /references/1
  # GET /references/1.json
  def show
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  # POST /references.json
  def create
    @reference = Reference.new(reference_params)
    @reference.user = current_user
    @reference.project = current_project

    respond_to do |format|
      if @reference.save
        format.html { redirect_to references_path(:pid => current_project.id), notice: 'Reference was successfully created.' }
        format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :new }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to references_path(:pid => current_project.id), notice: 'Reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @reference }
      else
        format.html { render :edit }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_path(:pid => current_project.id), notice: 'Reference was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    def authenticate_user
      if !signed_in?
        redirect_to '/login'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_params
      params.require(:reference).permit(:user_id, :ref_title, :ref_link, :ref_note)
    end
end
