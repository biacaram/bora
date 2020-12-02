class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews
  has_many :explorations
  has_many :explored_activities, source: :activity, through: :explorations
  has_many :activities
  has_many :received_reviews, class_name: "Review", foreign_key: "reviewed_user_id"
  include Countries
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  GENRES = %w(male female other)
  validates :full_name, presence: true
  validates :genre, presence: true, inclusion: { in: GENRES }
  validates :country, presence: true, inclusion: { in: COUNTRIES }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
end
