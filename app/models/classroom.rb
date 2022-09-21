class Classroom < ApplicationRecord
  include Filterable

  has_many :meetings, dependent: :destroy
  has_many :teachers, through: :meetings
  has_many :blocks, through: :meetings
  belongs_to :building

  validates :name, presence: true

  def free_blocks
    Block.where.not(id: block_ids)
  end

  def full_name
    "#{building.name} #{name}"
  end
end
