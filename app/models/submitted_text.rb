class SubmittedText < ApplicationRecord
  belongs_to :user
  has_many :translated_texts
end
