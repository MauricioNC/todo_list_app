class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.turbo_stream { }
        format.html { redirect_to root_path, notice: "Task created successfully." }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task, notice: "Task updated successfully."
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
