# frozen_string_literal: true

module Docs
  module V1
    module Authentication
      extend Dox::DSL::Syntax

      document :api do
        resource 'Authentication' do
          endpoint '/authentication'
          group 'Authentication'
        end
      end

      document :create do
        action 'Sign In'
      end

      document :destroy do
        action 'Sign Out'
      end
    end
  end
end
