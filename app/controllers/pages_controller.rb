class PagesController < ApplicationController
    before_action :find_story, only: [:show]
    def index
        # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
        
        # 增加 where 去限制撈到的資料
        # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
        
        # 使用scope
        # @stories = Story.published_stories.order(created_at: :desc).includes(:user)
        
        # 因為使用了狀態機 (AASM), 有內建方法,就不用 scope
        # @stories = Story.published.order(created_at: :desc).includes(:user)
        
        # Active Storage 把檔案都另外存,所以上面的語法會有 N+1 的問題
        # with_attached_cover_image 是 Rails 內建的方法,可以順便把附檔一起讀出來
        # with_attached_cover_image 的 cover_image 是附檔的名稱,
        # 如果要抓 avatar,就是 with_attached_avatar
        #@stories = Story.published.with_attached_cover_image.order(created_at: :desc).includes(:user)

        #太長一串,丟到 scope 中
        @stories = Story.published_stories
    end

    def show
        @comment = @story.comments.new
        @comments = @story.comments.order(id: :desc)
    end

    private
    def find_story
        @story = Story.friendly.find(params[:story_id])
    end


end
