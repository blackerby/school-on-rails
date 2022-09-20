require 'application_system_test_case'

class BuildingsTest < ApplicationSystemTestCase
  test 'viewing the index' do
    visit buildings_path
    assert_selector 'h1', text: 'All Buildings'
    assert_text buildings(:one).name
    assert_text buildings(:two).name
  end

  test 'should create Building' do
    sign_in users(:admin)
    visit buildings_path

    click_on 'Add New Building'

    fill_in 'Name', with: 'D'

    click_on 'Create Building'

    assert_selector 'h1', text: 'D'
  end

  test 'should edit Building' do
    sign_in users(:admin)
    visit building_path(buildings(:one))

    within '#actions' do
      click_on 'Edit'
    end

    fill_in 'Name', with: 'D'

    click_on 'Update Building'

    assert_selector 'h1', text: 'Editing Town Hall'
  end

  test 'should delete Building' do
    sign_in users(:admin)
    visit building_path(buildings(:one))

    within '#actions' do
      click_on 'Delete'
      accept_confirm
    end

    assert_selector 'h1', text: 'All Buildings'
  end

  test 'should search by name' do
    visit buildings_path

    fill_in 'Search', with: 'Gym'

    assert_selector 'li', text: 'Gym'
    assert_no_selector 'li', text: 'Town Hall'
  end
end
