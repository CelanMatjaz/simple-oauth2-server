class User < ApplicationRecord
  include ActiveModel::SecurePassword

  has_many :applications
  has_secure_password
end
