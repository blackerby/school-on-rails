class Teacher < ApplicationRecord
  belongs_to :department, optional: true
  has_many :meetings, dependent: :destroy
  has_many :blocks, through: :meetings

  accepts_nested_attributes_for :meetings

  scope :filter_by_name, ->(name) { where('first_name LIKE :name OR last_name LIKE :name', name: "%#{name}%") }

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def blocks
    meetings.map(&:block)
  end

  def free
    Block.where.not(id: blocks)
  end
end
