require 'rails_helper'

RSpec.describe Classroom, '#free_blocks' do
  it 'returns blocks when classroom is not in use' do
    meeting = create(:meeting)
    block = meeting.block
    classroom = meeting.classroom

    expect(classroom.free_blocks).not_to include block
  end
end
