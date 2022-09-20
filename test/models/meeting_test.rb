require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  test 'should not save meeting where block and teacher already taken' do
    teacher = teachers(:stegner)
    block = blocks(:a)
    classroom = classrooms(:contemp)
    meeting = Meeting.new(teacher: teacher, block: block, classroom: classroom)

    assert_not meeting.save, 'Saved a meeting with duplicate teacher/block'
  end
end
