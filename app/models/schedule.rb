class Schedule < ApplicationRecord
  belongs_to :teacher
  has_many :meetings, dependent: :destroy
end
