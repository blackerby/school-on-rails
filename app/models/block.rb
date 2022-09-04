class Block < ApplicationRecord
  include Filterable

  has_many :teacher_blocks, dependent: :destroy
  has_many :teachers, through: :teacher_blocks
end
