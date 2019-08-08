class User < ApplicationRecord
    require 'digest'
    before_create :create_token

    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum:6, maximum:22}

    has_secure_password

    def create_token
        token = SecureRandom.urlsafe_base64
        token = Digest::SHA1.hexdigest(token)
        token = token.to_s
        self.remember_token = token
    end
end