class Building < ApplicationRecord
  include Filterable

  has_many :classrooms, dependent: :destroy
end
