class User < ApplicationRecord
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :like_tweets,
           through: :likes,
           source: :tweet

  validates :uid, presence: true, uniqueness: true

  def password=(raw_password)
    self.pass = BCrypt::Password.create(raw_password)
  end

  def authenticate(raw_password)
    BCrypt::Password.new(pass) == raw_password
  rescue BCrypt::Errors::InvalidHash
    false
  end
end