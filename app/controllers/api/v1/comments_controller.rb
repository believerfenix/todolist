# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authorize_access_request!
      before_action :find_entity, only: :destroy

      def create
        @comment = Comment.new(comment_params)
        if @comment.valid?
          authorize @comment
          @comment.save

          render_entity(:created)
        else
          render_entity_errors
        end
      end

      def destroy
        @comment.destroy
        render json: { message: I18n.t('successfully_deleted') }, status: :ok
      end

      private

      def comment_params
        params.require(:comment).permit(:body, :file, :task_id)
      end
    end
  end
end
