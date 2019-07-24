class User < ApplicationRecord
  has_many :books
  attachment :profile_image
  validates :name, uniqueness: true
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #deviseでemailを不必要にする
   def email_require?
   	false
   end
   def email_changed?
   	false
   end
end