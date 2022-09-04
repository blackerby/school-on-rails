class Block < ApplicationRecord
  include Filterable

  has_many :teacher_blocks, dependent: :destroy
  has_many :teachers, through: :teacher_blocks
  has_many :classroom_blocks, dependent: :destroy
  has_many :classrooms, through: :classroom_blocks

  validates :name, presence: true
end
