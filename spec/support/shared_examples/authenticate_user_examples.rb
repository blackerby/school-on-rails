RSpec.shared_examples 'authenticate before action' do
  it 'should redirect to the sign in page' do
    action
    expect(response).to redirect_to new_user_session_path
  end
end
