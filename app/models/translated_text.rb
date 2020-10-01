class TranslatedText < ApplicationRecord
  belongs_to :user
  belongs_to :submitted_text
  has_many :evaluations
end
