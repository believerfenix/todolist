# frozen_string_literal: true

RSpec.describe Task, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:project) }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
    end
  end
end
