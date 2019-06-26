class User < ApplicationRecord
  devise :database_authenticatable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: Settings.validations.email_regex }
end
