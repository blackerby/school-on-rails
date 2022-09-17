require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def setup
    @teacher = teachers(:stegner)
    @a_block = blocks(:a)
    @another_block = blocks(:b)
  end

  test '#free_blocks' do
    free_blocks = @teacher.free_blocks
    assert_includes free_blocks, @another_block
    assert_not_includes free_blocks, @a_block
  end
end
