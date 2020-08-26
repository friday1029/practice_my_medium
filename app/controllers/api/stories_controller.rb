class Api::StoriesController < Api::BaseController
    before_action :find_story
    def clap
            @story.increment!(:clap)
            render json: { status: @story.clap }
    end
    private
    def find_story
        @story = Story.friendly.find(params[:id])
    end

end
