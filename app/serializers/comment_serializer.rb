# frozen_string_literal: true

class CommentSerializer
  include JSONAPI::Serializer
  attributes :body, :file

  belongs_to :task
end
