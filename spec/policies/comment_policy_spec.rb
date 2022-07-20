# frozen_string_literal: true

describe CommentPolicy do
  subject(:comment_policy) { described_class.new(user, comment) }

  let(:resolved_scope) { described_class::Scope.new(user, Comment.all).resolve }
  let(:comment) { create(:comment) }
  let(:another_comment) { create(:comment) }
  let(:actions) { %i[create destroy] }

  context 'belongs to user' do
    let(:user) { comment.task.project.user }

    it { is_expected.to permit_actions(actions) }
    it do
      expect(resolved_scope).to include(comment)
      expect(resolved_scope).not_to include(another_comment)
    end
  end
end
