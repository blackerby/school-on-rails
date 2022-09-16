require 'rails_helper'

RSpec.feature 'User adds a classroom' do
  scenario 'they see the page for the new classroom' do
    sign_in create(:user)
    name = '24'

    visit classrooms_path
    click_on 'Add New Classroom'
    fill_in 'classroom_name', with: name
    click_on 'Create Classroom'

    expect(page).to have_selector('h1', text: "Classroom #{name}")
  end
end
