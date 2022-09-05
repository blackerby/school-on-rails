class Block < ApplicationRecord
  include Filterable

  validates :name, presence: true
end
