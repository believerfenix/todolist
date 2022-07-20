# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, -> { order(position: :asc) },
           dependent: :destroy,
           inverse_of: :project

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
