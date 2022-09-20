class Meeting < ApplicationRecord
  belongs_to :teacher
  belongs_to :block
  belongs_to :classroom

  validates :block, uniqueness: { scope: :teacher }
end
