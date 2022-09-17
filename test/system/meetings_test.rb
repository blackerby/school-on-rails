require 'application_system_test_case'

class MeetingsTest < ApplicationSystemTestCase
  test 'should add class' do
    sign_in users(:admin)
    visit teacher_path(teachers(:fleming))

    click_on 'Add Class'

    fill_in 'Course title', with: 'Vietnam'
    select 'A', from: 'meeting_block_id'
    select 'Contemp', from: 'meeting_classroom_id'

    click_on 'Create Meeting'

    assert_text 'Vietnam'
  end

  test 'should delete Meeting' do
    teacher = teachers(:stegner)
    sign_in users(:admin)
    visit teacher_path(teachers(:stegner))

    within '#classes' do
      click_on 'Delete'
      accept_confirm
    end

    assert_selector 'h1', text: teacher.name
  end

  test 'should edit Meeting' do
    new_course_title = 'Poetry'
    sign_in users(:admin)
    visit teacher_path(teachers(:stegner))

    within '#classes' do
      click_on 'Edit'
    end

    fill_in 'Course title', with: new_course_title
    select 'D', from: 'meeting_block_id'
    select 'Contemp', from: 'meeting_classroom_id'
    click_on 'Update Meeting'

    within '#classes' do
      assert_text new_course_title
    end
  end
end
