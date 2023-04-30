class QuestionsTag < ApplicationRecord
  belongs_to :question
  belongs_to :tag, dependent: :destroy
end
