require 'application_system_test_case'

class DepartmentsTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit departments_path
    assert_selector 'h1', text: 'All Departments'
    assert_text departments(:english).name
    assert_text departments(:history).name
  end

  test 'should create Department' do
    sign_in users(:admin)
    visit departments_path

    click_on 'Add New Department'

    fill_in 'Name', with: 'Admissions'

    click_on 'Create Department'

    assert_selector 'h1', text: 'Admissions'
  end

  test 'should edit Department' do
    sign_in users(:admin)
    visit department_path(departments(:english))

    within '#actions' do
      click_on 'Edit'
    end

    fill_in 'Name', with: 'Admissions'

    click_on 'Update Department'

    assert_selector 'h1', text: 'Admissions'
  end

  test 'should delete Department' do
    sign_in users(:admin)
    visit department_path(departments(:english))

    within '#actions' do
      click_on 'Delete'
      accept_confirm
    end

    assert_selector 'h1', text: 'All Departments'
  end

  test 'should search by name' do
    visit departments_path

    fill_in 'Search', with: 'English'

    assert_selector 'li', text: 'English'
    assert_no_selector 'li', text: 'History'
    take_failed_screenshot
  end
end
