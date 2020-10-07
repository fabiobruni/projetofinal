class SubmittedText < ApplicationRecord
  after_create :send_new_text_email

  belongs_to :user
  has_many :translated_texts, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_multiple_fields,
    against: [:institution, :service_title, :service, :target_public],
    using: {
      tsearch: { prefix: true }
    }


  private

  def send_new_text_email
    UserMailer.new_translation.deliver_now
  end
end
