class Story < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  include  AASM

  #validations
  validates :title, presence: true

  #relationships
  belongs_to :user
  has_one_attached :cover_image
  has_many :comments

  #scope
  #default_scope {where(deleted_at: nil) }
  #使用 paranoid 後,就不需要了

  #scope :published_stories, -> { where(status: 'published') }
  scope :published_stories, -> { published.with_attached_cover_image.order(created_at: :desc).includes(:user)}
  #@stories = Story.published.with_attached_cover_image.order(created_at: :desc).includes(:user)


  #instance methods
  # def destroy #軟體除用
  #   update(deleted_at: Time.now)
  # end
  #使用 paranoid 後,就不需要了

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end



  aasm(column: 'status', no_direct_assignment: true) do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :unpublish do
      transitions from: :published, to: :draft
    end
  end
  
  private
  def slug_candidates
    [
      :title,
      [:title,SecureRandom.hex[0,8]]
    ]
  end
end
