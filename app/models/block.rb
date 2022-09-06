class Block < ApplicationRecord
  include Filterable

  validates :name, presence: true

  def meetings
    Meeting.where(block_id: id)
  end
end
