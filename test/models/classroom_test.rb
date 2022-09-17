require "test_helper"

class ClassroomTest < ActiveSupport::TestCase
  def setup
    @classroom = classrooms(:swan)
    @a_block = blocks(:a)
    @another_block = blocks(:b)
  end

  test '#free_blocks' do
    free_blocks = @classroom.free_blocks
    assert_includes free_blocks, @another_block
    assert_not_includes free_blocks, @a_block
  end
end
