class Classroom < ApplicationRecord
  include Filterable

  has_many :classroom_blocks, dependent: :destroy
  has_many :blocks, through: :classroom_blocks

  validates :name, presence: true
end
