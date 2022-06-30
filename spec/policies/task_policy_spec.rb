# frozen_string_literal: true

describe TaskPolicy do
  subject(:task_policy) { described_class.new(user, task) }

  let(:resolved_scope) { described_class::Scope.new(user, Task.all).resolve }
  let(:task) { create(:task) }
  let(:another_task) { create(:task) }
  let(:actions) { %i[create update destroy] }

  describe 'belongs to user' do
    let(:user) { task.project.user }

    it { is_expected.to permit_actions(actions) }
    it do
      expect(resolved_scope).to include(task)
      expect(resolved_scope).not_to include(another_task)
    end
  end
end
