class Question < ApplicationRecord
  validates :body, presence: true, length: {maximum: 280}

  belongs_to :user

  def hidden?
    hidden
  end
end
