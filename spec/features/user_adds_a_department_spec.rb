require 'rails_helper'

RSpec.feature 'User adds a department' do
  scenario 'they see the page for the new department' do
    sign_in create(:user)
    name = 'Admissions'

    visit departments_path
    click_on 'Add New Department'
    fill_in 'department_name', with: name
    click_on 'Create Department'

    expect(page).to have_selector('h1', text: "#{name}")
  end
end
