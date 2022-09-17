require 'test_helper'

class TeachersHelperTest < ActionView::TestCase
  test 'should return "No Department Assigned" if teacher has no department' do
    assert link_to_department(teachers(:connerly).department), 'No Department Assigned'
  end
end
