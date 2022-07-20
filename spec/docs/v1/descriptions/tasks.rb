# frozen_string_literal: true

module Docs
  module V1
    module Tasks
      extend Dox::DSL::Syntax

      document :api do
        resource 'Tasks' do
          endpoint '/tasks'
          group 'Tasks'
        end
      end

      document :create do
        action 'Create a task'
      end

      document :update do
        action 'Update a task'
      end

      document :destroy do
        action 'Delete a task'
      end
    end
  end
end
