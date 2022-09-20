require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get building index' do
    get buildings_url
    assert_select('h1', 'All Buildings')
  end

  test 'should get building show page' do
    building = buildings(:one)

    get building_url(building)
    assert_select('h1', "#{building.name}")
  end

  test 'should show edit link for logged in users' do
    user = users(:admin)
    sign_in user

    get buildings_url
    assert_select('a', 'Edit')
  end

  test 'should not show edit link for visitors' do
    get buildings_url
    assert_select 'a', { count: 0, text: 'Edit' }, 'Should not show edit link to visitors'
  end

  test 'should show delete link for logged in users' do
    user = users(:admin)
    sign_in user

    get buildings_url
    assert_select('a', 'Delete')
  end

  test 'should not show delete link for visitors' do
    get buildings_url
    assert_select 'a', { count: 0, text: 'Delete' }, 'Should not show delete link to visitors'
  end

  test 'should show add new building button for logged in users' do
    user = users(:admin)
    sign_in user

    get buildings_url
    assert_select('a.btn', 'Add New Building')
  end

  test 'should not show add new block button for visitors' do
    get buildings_url
    assert_select 'a.btn', { count: 0, text: 'Add New Building' }, 'Should not show add new building button to visitors'
  end

  test 'should not let visitors go to edit page' do
    building = buildings(:one)

    get edit_building_url(building)
    assert_redirected_to new_user_session_url
  end

  test 'should let logged in users go to edit page' do
    user = users(:admin)
    sign_in user
    building = buildings(:one)

    get edit_building_url(building)
    assert_response :success
    assert_select 'h1', text: "Editing #{building.name}"
  end
end
