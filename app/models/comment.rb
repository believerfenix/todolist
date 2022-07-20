# frozen_string_literal: true

class Comment < ApplicationRecord
  SIZE = {
    body: (10..256),
    file: 10
  }.freeze

  FORMATS = [
    'image/png',
    'image/jpeg'
  ].freeze

  belongs_to :task

  has_one_attached :file

  validates :body, presence: true, length: { in: SIZE[:body] }
  validates :file, content_type: { in: FORMATS,
                                   message: I18n.t('errors.comment.file.format', formats: FORMATS.join(', ')) },
                   size: { less_than: SIZE[:file].megabytes,
                           message: I18n.t('errors.comment.file.size', size: SIZE[:file]) }
end
