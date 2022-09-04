class Teacher < ApplicationRecord
  belongs_to :department, optional: true

  validates :first_name, :last_name, :email, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
