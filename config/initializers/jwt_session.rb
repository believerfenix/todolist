JWTSessions.algorithm = Rails.application.credentials[:jwt_sessions][:algorithm]
JWTSessions.encryption_key = Rails.application.credentials[:jwt_sessions][:encryption_key]
