class Teacher < ApplicationRecord
  belongs_to :department, optional: true
  has_many :teacher_blocks, dependent: :destroy
  has_many :blocks, through: :teacher_blocks

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def free
    Block.where.not(id: blocks)
  end
end
