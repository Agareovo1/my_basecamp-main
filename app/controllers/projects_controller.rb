class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
     @project = Project.find(params[:id])
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
  end

  # GET /projects/1/edit
  def edit
     @project = current_user.projects.find(params[:id])
  end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.new(project_params)
      if @project.save
         redirect_to project_url(@project), notice: "Project was successfully created."
      else
         render :new
      end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
     @project = current_user.projects.find(params[:id])
      if @project.update(project_params)
        redirect_to project_url(@project), notice: "Project was successfully updated."
      else
        render :edit
      end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
     @project = current_user.projects.find(params[:id])
    @project.destroy

      redirect_to projects_url, notice: "Project was successfully destroyed."
    end

  private
   

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :title, :description)
    end
end
