# frozen_string_literal: true

RSpec.describe 'V1::Authentication', type: :request do
  include Docs::V1::Authentication::Api

  let(:user) { create(:user) }

  describe 'POST /api/v1/authentication#create' do
    include Docs::V1::Authentication::Create

    before { post api_v1_authentication_index_path, params: params }

    context 'success' do
      let(:params) { { username: user.username, password: user.password } }

      it 'signs in user', :dox do
        expect(response).to have_http_status :ok
        expect(response).to match_json_schema('authentication')
      end
    end

    context 'invalid credentials' do
      let(:params) { { username: 'aaa', password: 'eeee' } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'DELETE /api/v1/authentication#destroy' do
    include Docs::V1::Authentication::Destroy

    let(:user) { create(:user) }
    let(:token) do
      JWTSessions::Session.new(payload: { user_id: user.id },
                               refresh_by_access_allowed: true).login[:access]
    end
    let(:headers) { { authorization: token } }

    before { delete api_v1_authentication_path(id: user.id), headers: headers }

    it 'signs out user', :dox do
      expect(response).to have_http_status :no_content
    end
  end
end
