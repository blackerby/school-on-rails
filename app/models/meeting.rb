class Meeting < ApplicationRecord
  belongs_to :block
  belongs_to :classroom
  belongs_to :teacher

  validates :teacher, uniqueness: { scope: %i[block classroom] }

  def name
    block.name
  end
end
