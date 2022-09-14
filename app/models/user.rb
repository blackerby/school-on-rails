class User < ApplicationRecord
  # Thank you Michael Hartl:
  # https://www.learnenough.com/course/ruby_on_rails_tutorial_7th_edition/modeling_users/user_validations/format_validation
  before_save { self.email = email.downcase if email }

  validates :first_name, :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
