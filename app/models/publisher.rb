class Publisher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :bio, presence: true, length: {minimum: 10}
  validates :profile_picture, presence: true
  has_rich_text :bio
  
  has_one_attached :profile_picture
  has_many :articles, dependent: :destroy
end
