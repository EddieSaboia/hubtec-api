class Api::V1::TasksController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_task, only: %i[ update destroy ]
  before_action :set_task_destroyed, only: %i[ delete ]

  def index
    # render json: Task.find_tasks_by_user(current_user.id)
    render json: Task.find_tasks_by_user()
  end 

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    # @task.user_id = 1
    if @task.save
      render json: @task
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.soft_delete
      render json: :destroyed
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :end_time, :status)
  end
end
