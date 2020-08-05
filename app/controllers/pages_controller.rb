class PagesController < ApplicationController
    def index
        # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
        # 增加 where 去限制撈到的資料
        # @stories = Story.where(status: 'published').order(created_at: :desc).includes(:user)
        # 使用scope
        # @stories = Story.published_stories.order(created_at: :desc).includes(:user)
        # 因為使用了狀態機 (AASM), 有內建方法,就不用 scope
        @stories = Story.published.order(created_at: :desc).includes(:user)
    end
end
