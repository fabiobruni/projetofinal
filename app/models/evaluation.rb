class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :translated_text
  has_one :submitted_text, through: :translated_text
end
