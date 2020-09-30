class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submitted_texts, dependent: :destroy
  has_many :translated_texts, dependent: :destroy
  has_many :evaluations, through: :translated_texts
end
