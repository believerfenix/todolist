# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  has_many :projects
end
