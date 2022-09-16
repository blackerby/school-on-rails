require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  context 'a visitor is not logged in' do
    context 'and tries to access the new meeting path' do
      it_behaves_like 'authenticate before action' do
        let(:teacher) { create(:teacher) }
        let(:action) { get :new, params: { teacher_id: teacher } }
      end
    end

    context 'and tries to access an edit meeting path' do
      it_behaves_like 'authenticate before action' do
        let(:meeting) { create(:meeting) }
        let(:action) { get :edit, params: { id: meeting.id, teacher_id: meeting.teacher } }
      end
    end
  end
end
