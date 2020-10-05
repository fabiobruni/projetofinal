class Evaluation < ApplicationRecord
  belongs_to :translated_text
  belongs_to :user
  validates :stars, numericality: true, presence: true, inclusion: { in: [ 1, 2, 3, 4, 5] }
end
