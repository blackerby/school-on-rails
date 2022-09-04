class Department < ApplicationRecord
  has_many :teachers, dependent: :nullify

  validates :name, presence: true
end
