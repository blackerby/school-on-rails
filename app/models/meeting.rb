class Meeting < ApplicationRecord
  belongs_to :schedule, optional: true

  def block
    Block.find(block_id)
  end
end
