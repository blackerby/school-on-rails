require 'application_system_test_case'

class ClassroomsTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit classrooms_path
    assert_selector 'h1', text: 'All Classrooms'
    assert_selector 'li', text: /Town Hall Swan/
    assert_selector 'li', text: /Gym Contemp/
  end

  test 'should create Classroom' do
    sign_in users(:admin)
    visit classrooms_path

    click_on 'Add New Classroom'

    fill_in 'Name', with: 'Senior Lounge'
    select 'Town Hall', from: 'classroom_building_id'

    click_on 'Create Classroom'

    assert_selector 'h1', text: 'Town Hall Senior Lounge'
  end

  test 'should edit Classroom' do
    sign_in users(:admin)
    visit classroom_path(classrooms(:swan))

    click_on 'Edit'

    fill_in 'Name', with: 'Studio'

    click_on 'Update Classroom'

    assert_selector 'h1', text: 'Town Hall Studio'
  end

  test 'should delete Classroom' do
    sign_in users(:admin)
    visit classroom_path(classrooms(:swan))

    click_on 'Delete'
    accept_confirm

    assert_selector 'h1', text: 'All Classrooms'
  end

  test 'should search by name' do
    visit classrooms_path

    fill_in 'Search', with: 'Swan'

    assert_selector 'li', text: 'Swan'
    assert_no_selector 'li', text: 'Contemp'
    take_failed_screenshot
  end
end
