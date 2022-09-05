class Teacher < ApplicationRecord
  belongs_to :department, optional: true
  has_one :schedule, dependent: :destroy
  delegate :meetings, to: :schedule

  scope :filter_by_name, ->(name) { where('first_name LIKE :name OR last_name LIKE :name', name: "%#{name}%") }

  validates :first_name, :last_name, :email, :department, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
