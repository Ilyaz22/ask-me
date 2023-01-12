class User < ApplicationRecord
  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  has_secure_password

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :nickname, format: { with: /\A\w+\z/ }, length: { maximum: 40 }, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :header_color, format: { with: /\A#[[:xdigit:]]{6}\z/ }

  def to_param
    nickname
  end

  private

  def downcase_nickname
    nickname&.downcase!
  end
end
