require 'rails_helper'

RSpec.feature 'User adds a classroom' do
  scenario 'they see the class added to the teacher page', js: true do
    teacher = create(:teacher)
    block = create(:block)
    classroom = create(:classroom)
    sign_in create(:user)
    name = 'Shadow'

    visit teacher_path(teacher)
    click_on 'Add Class'
    fill_in 'meeting_course_title', with: name
    select block.name, from: 'meeting_block_id'
    select classroom.name, from: 'meeting_classroom_id'
    click_on 'Create Meeting'

    expect(page).to have_text(name)
  end
end
