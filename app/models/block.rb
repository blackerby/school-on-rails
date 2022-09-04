class Block < ApplicationRecord
  has_many :teachers, through: :teacher_blocks
end
