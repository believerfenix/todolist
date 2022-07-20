# frozen_string_literal: true

module Api
  module V1
    class TasksController < ApplicationController
      before_action :authorize_access_request!
      before_action :find_entity, except: :create

      def create
        @task = Task.new(task_params)
        if @task.valid?
          authorize @task
          @task.save

          render_entity(:created)
        else
          render_entity_errors
        end
      end

      def update
        Tasks::UpdateTaskService.new(task_params, @task).call
        if @task.errors.empty?
          render_entity(:ok)
        else
          render_entity_errors
        end
      end

      def destroy
        @task.destroy
        render json: { message: I18n.t('successfully_deleted') }, status: :ok
      end

      private

      def task_params
        params.require(:task).permit(:name, :deadline, :project_id, :position)
      end
    end
  end
end
