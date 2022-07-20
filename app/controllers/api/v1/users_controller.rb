# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          start_jwt_session
          render json: { tokens: tokens }, status: :created
        else
          render json: { errors: @user.errors }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:username, :password, :password_confirmation)
      end

      def start_jwt_session
        response.set_cookie(JWTSessions.access_cookie,
                            value: tokens[:access],
                            httponly: true,
                            secure: Rails.env.production?)
      end

      def tokens
        @tokens ||= Authorization::JwtSessionsService.new(@user).call
      end
    end
  end
end
