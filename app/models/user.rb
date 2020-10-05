class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submitted_texts, dependent: :destroy
  has_many :translated_texts
  has_many :evaluations
  has_one_attached :photo
  validates :name, presence: true
end
