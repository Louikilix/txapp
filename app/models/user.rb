class User < ApplicationRecord
  before_create :confirmation_token

  has_many :writing_definitions, dependent: :destroy

  validates :name, presence: true
  EMAIL_FORMAT_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT_REGEX }, uniqueness: true

  before_save { self.email = email.downcase }

  has_secure_password


  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
    
  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end



end