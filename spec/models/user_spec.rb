# frozen_string_literal: true

RSpec.describe User, type: :model do
  context 'validations' do
    context 'presence' do
      it { is_expected.to validate_presence_of(:username) }
      it { is_expected.to validate_presence_of(:password) }
    end

    context 'length' do
      it do
        is_expected.to validate_length_of(:username).is_at_least(User::USERNAME_RANGE[:min])
                                                    .is_at_most(User::USERNAME_RANGE[:max])
      end
      it do
        is_expected.to validate_length_of(:password).is_at_least(User::PASSWORD_RANGE[:min])
                                                    .is_at_most(User::PASSWORD_RANGE[:max])
      end
    end

    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of(:username) }
    end

    context 'confirmation' do
      it { is_expected.to validate_confirmation_of(:password) }
    end
  end

  context 'when values are invalid' do
    let(:user) { build(:user) }

    it { is_expected.not_to allow_value('a' * (User::USERNAME_RANGE[:min] - 1)).for(:username) }
    it { is_expected.not_to allow_value('a' * (User::USERNAME_RANGE[:max] + 1)).for(:username) }
    it { is_expected.not_to allow_value('a' * (User::PASSWORD_RANGE[:min] - 1)).for(:password) }
    it { is_expected.not_to allow_value('a' * (User::PASSWORD_RANGE[:max] + 1)).for(:password) }
  end
end
