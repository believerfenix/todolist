# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  PASSWORD_RANGE = { min: 8, max: 50 }.freeze
  USERNAME_RANGE = { min: 3, max: 50 }.freeze

  has_many :projects, dependent: :destroy

  validates :username, :password, presence: true
  validates :password, length: { minimum: PASSWORD_RANGE[:min], maximum: PASSWORD_RANGE[:max] }
  validates :username, length: { minimum: USERNAME_RANGE[:min], maximum: USERNAME_RANGE[:max] }
  validates :username, uniqueness: true
end
