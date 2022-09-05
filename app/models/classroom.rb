class Classroom < ApplicationRecord
  include Filterable

  has_many :meetings, dependent: :destroy
  has_many :blocks, through: :meetings
  has_many :teachers, through: :meetings

  validates :name, presence: true
end
