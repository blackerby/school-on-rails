require 'rails_helper'

RSpec.describe Teacher, '#name' do
  it "lists the teacher's full name" do
    teacher = build(:teacher)

    expect(teacher.name).to eql [teacher.first_name, teacher.last_name].join(' ')
  end
end

RSpec.describe Teacher, '#free_blocks' do
  it "returns the teacher's free blocks" do
    teacher = create(:teacher)

    expect(teacher.free_blocks).not_to include teacher.meetings.first
  end
end
