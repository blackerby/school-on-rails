require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  login_user

  it 'should have a current_user' do
    expect(subject.current_user).to_not eq(nil)
  end
  # expect(response).to have_http_status(200)
end
