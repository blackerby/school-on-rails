require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  def setup
    @block = blocks(:a_block)
    @a_teacher = teachers(:one)
    @another_teacher = teachers(:two)
    @a_classroom = classrooms(:one)
    @another_classroom = classrooms(:two)
  end

  test 'should not save block without name' do
    block = Block.new
    assert_not block.save, 'Saved the block without a name'
  end

  test '#free_teachers' do
    free_teachers = @block.free_teachers
    assert free_teachers.include?(@another_teacher)
    assert_not free_teachers.include?(@a_teacher)
  end

  test '#free_classrooms' do
    free_classrooms = @block.free_classrooms
    assert free_classrooms.include?(@another_classroom)
    assert_not free_classrooms.include?(@a_classroom)
  end
end
