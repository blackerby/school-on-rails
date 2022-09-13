require 'rails_helper'

RSpec.describe Block, '#free_teachers' do
  it 'returns teachers who do not teach during this block' do
    meeting = create(:meeting)
    block = meeting.block
    teacher = meeting.teacher

    expect(block.free_teachers).not_to include teacher
  end
end

RSpec.describe Block, '#free_classrooms' do
  it 'returns teachers who do not teach during this block' do
    meeting = create(:meeting)
    block = meeting.block
    classroom = meeting.classroom

    expect(block.free_classrooms).not_to include classroom
  end
end
