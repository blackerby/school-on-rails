require 'rails_helper'

RSpec.feature 'User edits a department' do
  scenario 'they see the change on the department page' do
    sign_in create(:user)
    department = create(:department)
    name = 'Pizza'

    visit department_path(department)
    click_on 'Edit'
    fill_in 'department_name', with: name
    click_on 'Update Department'

    expect(page).to have_selector('h1', text: "#{name}")
  end
end
