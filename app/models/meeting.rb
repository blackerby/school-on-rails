class Meeting < ApplicationRecord
  belongs_to :schedule, dependent: :destroy
end
