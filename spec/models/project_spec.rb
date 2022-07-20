# frozen_string_literal: true

RSpec.describe Project, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'uniqueness' do
      subject { create(:project) }
      it { should validate_uniqueness_of(:name).scoped_to(:user_id) }
    end
  end
end
