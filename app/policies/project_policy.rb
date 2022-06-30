# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def belongs_to_user?
    @record.user.eql?(@user)
  end

  class Scope < Scope
    def resolve
      @scope.where(user: @user)
    end
  end
end
