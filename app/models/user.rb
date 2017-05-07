class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :username, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 64 },
                    uniqueness: { case_sensitive: false },
                    email_format: { message: "doesn't look like an email address" }
end

# Using this to validate email format
# gem 'validates_email_format_of'