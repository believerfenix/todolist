# frozen_string_literal: true

module Tasks
  class UpdateTaskService
    def initialize(task_params, task)
      @task_params = task_params
      @task = task
    end

    def call
      @task_params[:position] ? update_position : @task.update(@task_params)

      @task
    end

    private

    def update_position
      @task.move_higher if @task_params[:position] == 'up'
      @task.move_lower if @task_params[:position] == 'down'
    end
  end
end
