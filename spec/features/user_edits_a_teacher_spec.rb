require 'rails_helper'

RSpec.feature 'User edits a teacher' do
  scenario 'they see the changes on the teacher page' do
    teacher = create(:teacher)
    department = create(:department, name: 'Yup')
    sign_in create(:user)
    first_name = 'Toast'
    last_name  = 'Pizza'
    email = '2@example.com'

    visit teacher_path(teacher)
    click_on 'Edit'
    fill_in 'teacher_first_name', with: first_name
    fill_in 'teacher_last_name', with: last_name
    fill_in 'teacher_email', with: email
    select department.name, from: 'teacher_department_id'
    click_on 'Update Teacher'

    expect(page).to have_selector('h1', text: "#{first_name} #{last_name}")
  end
end
