class Schedule < ApplicationRecord
  belongs_to :teacher, dependent: :destroy
  has_many :meetings, dependent: :destroy

  accepts_nested_attributes_for :meetings
end
