class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :meetings
end
