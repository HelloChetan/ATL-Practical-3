class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path
      else
        render :index
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path
    end
  
    def toggle
      @task = Task.find(params[:id])
      @task.update(completed: !@task.completed)
      redirect_to tasks_path
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title)
    end
  end
  