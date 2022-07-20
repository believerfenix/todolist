# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  include Pundit::Authorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  private

  def not_authorized
    render json: { error: I18n.t('authentication.not_authorized') }, status: :unauthorized
  end

  def render_entity(status)
    serialized_object = "#{entity_class_name}Serializer".constantize.new(entity).serializable_hash.to_json
    render json: serialized_object, status: status
  end

  def render_entity_errors
    render json: { errors: entity.errors }, status: :unprocessable_entity
  end

  def find_entity
    set_entity
    return render status: :not_found if entity.nil?

    authorize entity
  end

  def entity
    instance_variable_get("@#{entity_class_name.underscore}")
  end

  def set_entity
    instance_variable_set("@#{entity_class_name.underscore}", entity_class_name.constantize.find_by(id: params[:id]))
  end

  def entity_class_name
    @entity_class_name ||= controller_name.classify
  end
end
