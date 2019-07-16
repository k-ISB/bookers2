class User < ApplicationRecord
  has_one :plofile_image
  attachment :profile_image
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end