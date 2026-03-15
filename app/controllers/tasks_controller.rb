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
        # redirect_to root_path, notice: "Task created successfully."
        format.turbo_stream { }
        format.html { redirect_to root_path, notice: "Task created successfully." }
      else
        render :new, status: :unprocessable_entity
      end
    end

  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
