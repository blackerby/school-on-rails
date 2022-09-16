class Block < ApplicationRecord
  include Filterable

  has_many :meetings, dependent: :destroy
  has_many :teachers, through: :meetings
  has_many :classrooms, through: :meetings

  validates :name, presence: true, uniqueness: true

  def free_teachers
    Teacher.where.not(id: teacher_ids)
  end

  def free_classrooms
    Classroom.where.not(id: classroom_ids)
  end
end
