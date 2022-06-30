# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :authorize_access_request!, only: :destroy

      def create
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
          start_jwt_session
          render json: { tokens: tokens }
        else
          render json: { error: I18n.t('authentication.invalid_sing_in_credentials') }, status: :unauthorized
        end
      end

      def destroy
        session = JWTSessions::Session.new(payload: payload)
        session.flush_by_access_payload
      end

      private

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
