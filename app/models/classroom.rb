class Classroom < ApplicationRecord
  include Filterable

  validates :name, presence: true

  def meetings
    Meeting.where(classroom_id: id)
  end
end
