# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def belongs_to_user?
    @record.project.user.eql?(@user)
  end

  class Scope < Scope
    def resolve
      @scope.joins(:project).where(projects: { user: @user })
    end
  end
end
