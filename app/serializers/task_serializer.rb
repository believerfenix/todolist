# frozen_string_literal: true

class TaskSerializer
  include JSONAPI::Serializer
  attributes :name, :deadline, :position, :is_done

  has_many :comments
end
