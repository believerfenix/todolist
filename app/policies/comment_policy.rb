# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  def belongs_to_user?
    @record.task.project.user.eql?(@user)
  end

  class Scope < Scope
    def resolve
      @scope.joins(task: :project).where(tasks: { projects: { user: @user } })
    end
  end
end
