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
    @task = set_task
  end

  def create
    @task = @project.tasks.new(task_params)
    project_id = set_project.id

    if @task.save
      redirect_to project_path(@project), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    @task = set_task

    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task = set_task
    if @task.destroy
      redirect_to project_path(@project), notice: 'Task was successfully destroyed.'
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
      params.require(:task).permit(:name)
    end
end
