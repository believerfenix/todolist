# frozen_string_literal: true

describe ProjectPolicy do
  subject(:project_policy) { described_class.new(user, project) }

  let(:resolved_scope) { described_class::Scope.new(user, Project.all).resolve }
  let(:project) { create(:project) }
  let(:another_project) { create(:project) }
  let(:actions) { %i[create update destroy] }

  describe 'belongs to user' do
    let(:user) { project.user }

    it { is_expected.to permit_actions(actions) }
    it do
      expect(resolved_scope).to include(project)
      expect(resolved_scope).not_to include(another_project)
    end
  end
end
