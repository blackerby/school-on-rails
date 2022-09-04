class Department < ApplicationRecord
  include Filterable

  has_many :teachers, dependent: :nullify

  validates :name, presence: true
end
