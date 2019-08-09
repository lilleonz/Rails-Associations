class User < ApplicationRecord
    before_create :create_remember_token
    has_secure_password
    validates :password, length: {minimum:6, maximum:18}
    
    has_many :created_events, foreign_key: :creator_id, class_name: :Event
 
    has_many :attendances, foreign_key: :event_attendee_id
    has_many :attended_events, through: :attendances

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end
    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
    private
    
    def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
    end
end