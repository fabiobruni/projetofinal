class SubmittedText < ApplicationRecord
  belongs_to :user
  has_many :translated_texts, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_multiple_fields,
    against: [:institution, :service_title, :service, :target_public],
    using: {
      tsearch: { prefix: true }
    }
end
