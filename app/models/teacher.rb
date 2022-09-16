class Teacher < ApplicationRecord
  belongs_to :department
  has_many :meetings, dependent: :destroy
  has_many :classrooms, through: :meetings
  has_many :blocks, through: :meetings

  scope :filter_by_name, ->(name) { where('first_name LIKE :name OR last_name LIKE :name', name: "%#{name}%") }

  validates :first_name, :last_name, :email, :department, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def free_blocks
    Block.where.not(id: block_ids)
  end
end
