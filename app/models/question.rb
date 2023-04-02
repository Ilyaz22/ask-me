class Question < ApplicationRecord
  after_commit :save_hashtags, on: %i[ create update ]

  has_many :questions_tags, dependent: :destroy
  has_many :tags, through: :questions_tags

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  validates :body, presence: true, length: {maximum: 280}

  private

  def save_hashtags
    self.tags = "#{body} #{answer}".downcase.scan(/#[[:word:]]+/).uniq.map do |tag|
      Tag.find_or_create_by(name: tag.delete('#'))
    end
  end
end
