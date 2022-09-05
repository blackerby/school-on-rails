class Classroom < ApplicationRecord
  include Filterable

  validates :name, presence: true
end
