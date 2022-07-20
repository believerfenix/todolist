# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authorize_access_request!
      before_action :find_entity, except: :create

      def create
        @project = Project.new(project_params)
        if @project.valid?
          authorize @project
          @project.save

          render_entity(:created)
        else
          render_entity_errors
        end
      end

      def update
        if @project.update(project_params)
          render_entity(:ok)
        else
          render_entity_errors
        end
      end

      def destroy
        @project.destroy
        render json: { message: I18n.t('successfully_deleted') }, status: :ok
      end

      private

      def project_params
        params.require(:project).permit(:name).merge(user: current_user)
      end
    end
  end
end
