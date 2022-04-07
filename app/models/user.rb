class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :password, length: { in: 8..20 }
	validates :password_confirmation, presence: true
	has_many :comments
end
