require 'rails_helper'

RSpec.feature 'User adds a teacher' do
  scenario 'they see the page for the new department' do
    department = create(:department)
    sign_in create(:user)
    first_name = 'Test'
    last_name = 'Teacher'
    email = '1@example.com'

    visit teachers_path
    click_on 'Add New Teacher'
    fill_in 'teacher_first_name', with: first_name
    fill_in 'teacher_last_name', with: last_name
    fill_in 'teacher_email', with: email
    select department.name, from: 'teacher_department_id'
    click_on 'Create Teacher'

    expect(page).to have_selector('h1', text: "#{first_name} #{last_name}")
  end
end
