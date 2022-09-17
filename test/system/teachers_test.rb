require 'application_system_test_case'

class TeachersTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit teachers_path
    assert_selector 'h1', text: 'All Teachers'
    assert_text teachers(:stegner).name
    assert_text teachers(:fleming).name
  end

  test 'should create Teacher' do
    sign_in users(:admin)
    visit teachers_path

    click_on 'Add New Teacher'

    fill_in 'First name', with: 'Elna'
    fill_in 'Last name', with: 'Tuohy'
    fill_in 'Email', with: 'tuohy@example.com'
    select 'English', from: 'teacher_department_id'

    click_on 'Create Teacher'

    assert_selector 'h1', text: 'Elna Tuohy'
  end

  test 'should edit Teacher' do
    sign_in users(:admin)
    visit teacher_path(teachers(:fleming))

    within '#actions' do
      click_on 'Edit'
    end

    fill_in 'First name', with: 'Macdonald'
    fill_in 'Last name', with: 'Flamingo'
    fill_in 'Email', with: 'flamingo@example.com'
    select 'English', from: 'teacher_department_id'

    click_on 'Update Teacher'

    assert_selector 'h1', text: 'Macdonald Flamingo'
  end

  test 'should delete Teacher' do
    sign_in users(:admin)
    visit teacher_path(teachers(:stegner))

    within '#actions' do
      click_on 'Delete'
      accept_confirm
    end

    assert_selector 'h1', text: 'All Teachers'
  end

  test 'should search by name' do
    visit teachers_path

    fill_in 'Search', with: 'Fleming'

    assert_selector 'li', text: 'Fleming'
    assert_no_selector 'li', text: 'Stegner'
  end
end
