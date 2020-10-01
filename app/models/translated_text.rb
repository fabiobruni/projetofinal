class TranslatedText < ApplicationRecord
  belongs_to :user
  belongs_to :submitted_text
  has_many :evaluations
  include PgSearch::Model
  multisearchable against: [:url, :institution, :deadline, :service_title, :service, :target_public, :service_stages, :more_info]

end
