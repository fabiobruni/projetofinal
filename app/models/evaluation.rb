class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :translated_text
  has_one :submitted_text, through: :translated_text
  validates :stars, presence: true
  validates :stars, inclusion: { in: [1,2,3,4,5] }
end
