class SubmittedText < ApplicationRecord
  after_create :send_new_text_email

  belongs_to :user
  has_many :translated_texts, dependent: :destroy
  validates :deadline, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_multiple_fields,
    against: [:institution, :service_title, :service, :target_public],
    using: {
      tsearch: { prefix: true }
    }


  private

  def send_new_text_email
    users = User.where(is_writer: false)
    users.each do |user|
      UserMailer.new_translation(user.id).deliver_now
    end
  end
end
