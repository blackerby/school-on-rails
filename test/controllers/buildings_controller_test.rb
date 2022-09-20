require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get building index' do
    get buildings_url
    assert_response :success
  end

  test 'should get building show page' do
    building = buildings(:one)

    get building_url(building)
    assert_response :success
  end
end
