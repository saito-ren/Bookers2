class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatables

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: {maximum: 50}

  has_many :books, dependent: :destroy
  # refileを追加した時はここを追加、_idは省略する
  attachment :profile_image

end
