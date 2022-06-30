# frozen_string_literal: true

RSpec.describe 'V1::Projects', type: :request do
  include Docs::V1::Projects::Api

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:params) { { project: attributes_for(:project) } }
  let(:token) { JWTSessions::Session.new(payload: { user_id: user.id }).login[:access] }
  let(:headers) { { authorization: token } }

  describe 'POST /api/v1/projects' do
    include Docs::V1::Projects::Create

    before { post api_v1_projects_path, headers: headers, params: params }

    context 'success' do
      it 'creates a project', :dox do
        expect(response).to have_http_status :created
        expect(response).to match_json_schema('project')
      end
    end

    context 'invalid project' do
      let(:params) { { project: { name: nil } } }

      it 'return 422' do
        expect(response).to have_http_status :unprocessable_entity
      end
    end

    context 'unauthorized request' do
      let(:headers) { { authorization: nil } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'PUT /api/v1/projects/:id' do
    include Docs::V1::Projects::Update

    before { put api_v1_project_path(id: project_id), headers: headers, params: params }

    context 'success' do
      let(:project_id) { project.id }

      it 'updates a project', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid project' do
      let(:project_id) { 8888 }

      it 'return 404' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'unauthorized request' do
      let(:project_id) { project.id }
      let(:headers) { { authorization: nil } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'DELETE /api/v1/projects/:id' do
    include Docs::V1::Projects::Destroy

    before { delete api_v1_project_path(id: project_id), headers: headers }

    context 'success' do
      let(:project_id) { project.id }

      it 'deletes a project', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid project' do
      let(:project_id) { 8888 }

      it 'return 404' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'unauthorized request' do
      let(:project_id) { project.id }
      let(:headers) { { authorization: nil } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
