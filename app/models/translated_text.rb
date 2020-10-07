class TranslatedText < ApplicationRecord
  after_create :send_new_adoption_email

  belongs_to :user
  belongs_to :submitted_text
  has_many :evaluations, dependent: :destroy
  include PgSearch::Model
  multisearchable against: [:url, :institution, :service_title, :service, :target_public, :service_stages, :more_info]

  private

  def send_new_adoption_email
    UserMailer.new_adoption(self).deliver_now
  end


end
