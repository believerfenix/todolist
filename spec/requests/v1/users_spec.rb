# frozen_string_literal: true

RSpec.describe 'V1::User', type: :request do
  include Docs::V1::Users::Api

  describe 'POST /api/v1/users' do
    include Docs::V1::Users::Create

    before { post api_v1_users_path, params: user_params }

    context 'valid data' do
      let(:user_params) { attributes_for(:user) }

      it 'signs in user', :dox do
        expect(response).to have_http_status :created
        expect(response.body).to match_json_schema('user')
      end
    end

    context 'invalid data' do
      let(:user_params) { { username: nil, password: nil } }

      it 'signs in user' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
