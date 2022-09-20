require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  def setup
    @block = blocks(:a)
    @a_teacher = teachers(:stegner)
    @another_teacher = teachers(:fleming)
    @a_classroom = classrooms(:swan)
    @another_classroom = classrooms(:contemp)
  end

  test 'should not save block without name' do
    block = Block.new
    assert_not block.save, 'Saved the block without a name'
  end

  test 'should not save block without unique name' do
    block = Block.new(name: 'A')
    assert_not block.save, 'Saved the block with a duplicate name'
  end

  test '#free_teachers' do
    free_teachers = @block.free_teachers
    assert_includes free_teachers, @another_teacher
    assert_not_includes free_teachers, @a_teacher
  end

  test '#free_classrooms' do
    free_classrooms = @block.free_classrooms
    assert_includes free_classrooms, @another_classroom
    assert_not_includes free_classrooms, @a_classroom
  end
end
