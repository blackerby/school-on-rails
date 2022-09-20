require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test 'a building has a name' do
    building = buildings(:one)

    assert_not_empty building.name
  end

  test 'a building has associated classrooms' do
    building = buildings(:one)

    assert_not_empty building.classrooms
  end
end
