class Block < ApplicationRecord
  include Filterable

  has_many :meetings
  has_many :teachers, through: :meetings
  has_many :classrooms, through: :meetings

  validates :name, presence: true
end
