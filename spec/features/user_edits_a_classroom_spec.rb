require 'rails_helper'

RSpec.feature 'User edits a classroom' do
  scenario 'they see the change on the classroom page' do
    sign_in create(:user)
    classroom = create(:classroom)
    name = 'Pizza'

    visit classroom_path(classroom)
    click_on 'Edit'
    fill_in 'classroom_name', with: name
    click_on 'Update Classroom'

    expect(page).to have_selector('h1', text: "Classroom #{name}")
  end
end
