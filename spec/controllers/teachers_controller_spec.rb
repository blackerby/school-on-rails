require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  context 'a visitor is not logged in' do
    context 'and tries to access the new teachers path' do
      it_behaves_like 'authenticate before action' do
        let(:action) { get :new }
      end
    end

    context 'and tries to access an edit teacher path' do
      it_behaves_like 'authenticate before action' do
        let(:action) { get :edit, params: { id: create(:teacher) } }
      end
    end
  end
end
