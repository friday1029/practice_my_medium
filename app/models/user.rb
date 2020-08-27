class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: {
    user: 0,
    vip_user: 1,
    platinum_user: 2,
    admin: 3
  }
  
  # valitation
  validates :username, presence: true, uniqueness: true

  # relationships
  has_one_attached :avatar
  has_many :stories
  has_many :follows
  has_many :bookmarks

  # instance method
  def paid_user?
    # 使用了 enum 就會自動產生這樣的方法
    vip_user? or platinum_user?
    
    # role == 1 or role == 2
  end
  
  def bookmark?(story)
    bookmarks.exists?(story: story)
  end
  def bookmark!(story)
    if bookmark?(story)
      bookmarks.find_by(story: story).destroy
      return "Unbookmarked"
    else
      bookmarks.create(story: story)
      return "Bookmarked"
    end
  end

  
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
