class Department < ApplicationRecord
  has_many :teachers

  validates :name, presence: true
end
