class Admin::ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    redirect_to admin_project_path(@project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    redirect_to admin_project_path(@project)
  end

  def delete
  end

  private

  def project_params
    params.require(:project).permit(:name, :deadline)
  end
end
