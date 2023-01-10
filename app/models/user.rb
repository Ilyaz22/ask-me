class User < ApplicationRecord
  validates :nickname, format: { with: /\A[A-Za-z_0-9]+\z/ }, length: {maximum: 40}, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :header_color, format: { with: /\A#([a-f0-9]{3}){1,2}\z/i }

  has_many :questions, dependent: :delete_all

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  def downcase_nickname
    nickname.downcase!
  end

  def to_param
    nickname
  end
end
