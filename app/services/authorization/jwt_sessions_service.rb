# frozen_string_literal: true

module Authorization
  class JwtSessionsService
    def initialize(user)
      @user = user
    end

    def call
      payload = { user_id: @user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      session.login
    end
  end
end
