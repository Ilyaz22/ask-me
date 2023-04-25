class Tag < ApplicationRecord
  REGEX = /#[[:word:]]+/

  has_many :questions_tags, dependent: :destroy
  has_many :questions, through: :questions_tags
end
