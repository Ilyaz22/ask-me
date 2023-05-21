class Tag < ApplicationRecord
  REGEX = /#[[:word:]]+/

  scope :with_questions, -> { where_exists(:questions_tags) }

  has_many :questions_tags, dependent: :destroy
  has_many :questions, through: :questions_tags
end
