# frozen_string_literal: true

RSpec.describe 'V1::Tasks', type: :request do
  include Docs::V1::Tasks::Api

  let(:user) { create(:user) }
  let(:token) { JWTSessions::Session.new(payload: { user_id: user.id }).login[:access] }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:params) { { task: attributes_for(:task).merge(project_id: project.id) } }
  let(:headers) { { authorization: token } }

  describe 'POST /api/v1/tasks' do
    include Docs::V1::Tasks::Create

    before { post api_v1_tasks_path, headers: headers, params: params }

    context 'success' do
      it 'creates a task', :dox do
        expect(response).to have_http_status :created
        expect(response).to match_json_schema('task')
      end
    end

    context 'invalid task' do
      let(:params) { { task: { name: nil } } }

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

  describe 'PUT /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Update

    before { put api_v1_task_path(id: task_id), headers: headers, params: params }

    context 'success' do
      let(:task_id) { task.id }

      it 'updates a task', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid task' do
      let(:task_id) { 8888 }

      it 'return 404' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'unauthorized request' do
      let(:task_id) { task.id }
      let(:headers) { { authorization: nil } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end

  describe 'DELETE /api/v1/tasks/:id' do
    include Docs::V1::Tasks::Destroy

    before { delete api_v1_task_path(id: task_id), headers: headers }

    context 'success' do
      let(:task_id) { task.id }

      it 'deletes a task', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'invalid task' do
      let(:task_id) { 8888 }

      it 'return 404' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'unauthorized request' do
      let(:task_id) { task.id }
      let(:headers) { { authorization: nil } }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
