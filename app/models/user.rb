class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many  :books
  #一人のユーザー 沢山の本をもつ

  #以下、バリデーション
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  def email_required?
    false
  end
  def email_changed?
    false
  end

end
