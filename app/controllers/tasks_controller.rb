class TasksController < ApplicationController
  before_action :set_project
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = @project.tasks.new(task_params)
    project_id = set_project.id

    if @task.save
      redirect_to(@project)
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to @project, notice: 'Task was successfully destroyed.'
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name, :status, :completed_at, :project_id)
    end
end
