require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  def setup
    @classroom = classrooms(:swan)
    @building = @classroom.building
    @a_block = blocks(:a)
    @another_block = blocks(:b)
  end

  test '#free_blocks' do
    free_blocks = @classroom.free_blocks
    assert_includes free_blocks, @another_block
    assert_not_includes free_blocks, @a_block
  end

  test '#full_name' do
    assert_equal @classroom.full_name, "#{@building.name} #{@classroom.name}"
  end
end
