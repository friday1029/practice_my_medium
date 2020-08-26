class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # valitation
  validates :username, presence: true, uniqueness: true

  # relationships
  has_many :stories
  has_one_attached :avatar
  has_many :follows

  # instance method
  def follow?(user) # 問號回傳 true/false
    follows.exists?(following: user)  #回傳 true/false 較省資源
    # follows.where(following: user)  #回傳類似陣列,較浪費資源
  end
  def follow!(user)
    if follow?(user)
      follows.find_by(following: user).destroy
      return 'Follow'
    else
      follows.create(following: user)
      return 'Followed'
    end
  end
end
