# frozen_string_literal: true

RSpec.describe Comment, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:task) }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:body) }
    end

    context 'length' do
      let(:body) { Comment::SIZE[:body] }

      it { is_expected.to validate_length_of(:body).is_at_least(body.min).is_at_most(body.max) }
    end
  end
end
