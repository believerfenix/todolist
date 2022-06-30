# frozen_string_literal: true

RSpec.describe 'V1::Comments', type: :request do
  include Docs::V1::Comments::Api

  let(:user) { create(:user) }
  let(:token) { JWTSessions::Session.new(payload: { user_id: user.id }).login[:access] }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let(:params) { { comment: attributes_for(:comment).merge(task_id: task.id) } }
  let(:headers) { { authorization: token } }

  describe 'POST /api/v1/comments' do
    include Docs::V1::Comments::Create

    before { post api_v1_comments_path, headers: headers, params: params }

    context 'success' do
      it 'creates a comment', :dox do
        expect(response).to have_http_status :created
        expect(response).to match_json_schema('comment')
      end
    end

    context 'invalid comment' do
      let(:params) { { comment: { body: nil } } }

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

  describe 'DELETE /api/v1/comments/:id' do
    include Docs::V1::Comments::Destroy

    let(:comment) { create(:comment, task: task) }

    before { delete api_v1_comment_path(id: comment_id), headers: headers }

    context 'success' do
      let(:comment_id) { comment.id }

      it 'deletes a comment', :dox do
        expect(response).to have_http_status :ok
      end
    end

    context 'return 404' do
      let(:comment_id) { 8888 }

      it 'return 404' do
        expect(response).to have_http_status :not_found
      end
    end

    context 'unauthorized request' do
      let(:headers) { { authorization: nil } }
      let(:comment_id) { comment.id }

      it 'return 401' do
        expect(response).to have_http_status :unauthorized
      end
    end
  end
end
