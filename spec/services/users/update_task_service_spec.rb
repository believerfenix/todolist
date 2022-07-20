# frozen_string_literal: true

RSpec.describe Tasks::UpdateTaskService do
  subject(:UpdateTaskService) { described_class.new(task_params, task).call }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }

  describe 'name' do
    let(:new_name) { 'new_name' }
    let(:task_params) { { name: new_name } }

    before do
      subject
      task.reload
    end

    it 'update name' do
      expect(task.name).to eq(new_name)
    end
  end

  describe 'deadline' do
    let(:new_deadline) { rand(30..40).days.from_now.to_s }
    let(:task_params) { { deadline: new_deadline } }

    before do
      subject
      task.reload
    end

    it 'update deadline' do
      expect(task.deadline).to eq(new_deadline)
    end
  end

  describe 'is_done' do
    let(:new_is_done) { true }
    let(:task_params) { { is_done: new_is_done } }

    before do
      subject
      task.reload
    end

    it 'update deadline' do
      expect(task.is_done).to eq(new_is_done)
    end
  end

  describe 'position' do
    let(:position) { 'up' }
    let(:task_params) { { position: position } }

    context 'up' do
      let(:position) { 'up' }
      let!(:tasks) { create_list(:task, 2, project: project) }
      let!(:expected_result) { task.position - 1 }

      before do
        task
        subject
        task.reload
      end

      it 'update deadline' do
        expect(task.position).to eq(expected_result)
      end
    end

    context 'down' do
      let(:position) { 'down' }
      let!(:expected_result) { task.position + 1 }
      let!(:tasks) { create_list(:task, 2, project: project) }

      before do
        subject
        task.reload
      end

      it 'position down' do
        expect(task.position).to eq(expected_result)
      end
    end
  end
end
