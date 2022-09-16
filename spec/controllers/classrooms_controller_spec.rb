require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  context 'a visitor is not logged in' do
    context 'and tries to access the new classroom path' do
      it_behaves_like 'authenticate before action' do
        let(:action) { get :new }
      end
    end

    context 'and tries to access an edit classroom path' do
      it_behaves_like 'authenticate before action' do
        let(:action) { get :edit, params: { id: create(:classroom) } }
      end
    end
  end
end
