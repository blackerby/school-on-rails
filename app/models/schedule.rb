class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :meetings, dependent: :destroy

  accepts_nested_attributes_for :meetings,
                                reject_if: proc { |a| a[:classroom_id].blank? || a[:block_id].blank? },
                                allow_destroy: true
end
