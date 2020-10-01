class SubmittedText < ApplicationRecord
  belongs_to :user
  has_many :translated_texts
  include PgSearch::Model
  multisearchable against: [:url, :institution, :deadline, :service_title, :service, :target_public, :service_stages, :more_info]

end
