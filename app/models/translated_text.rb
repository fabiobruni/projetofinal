class TranslatedText < ApplicationRecord
  belongs_to :user
  belongs_to :submitted_texts
  has_many :evaluations
end
