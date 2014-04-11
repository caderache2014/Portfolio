class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verfiy_authenticity_token, only: [:update]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created"
          redirect_to @project
        else
          flash.now[:error] = "Project could not be saved"
          render :new
        end
      end
      format.js do
        if @project.save

        else
          render text: @project.errors.full_messages.join(". "), status: :unprocessable_entity
        end
      end
    end
  end
  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
    @project = Projec.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated"
      respond_to do |format|
        format.html {redirect_to projects_url }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_url}
      format.json { head :no_content }
    end
  end
private

  def project_params
    params.require(:project).permit(:name, :technologies_used, :locale, :image)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end

