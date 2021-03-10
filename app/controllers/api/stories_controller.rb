class Api::StoriesController < Api::BaseController
  # before_action :set_story
  before_action :set_users

  def index

  end

  def create
    story = current_user.stories.build(story_params)
    # binding.pry
    if story.save
      render json: { message: 'successfuly created', data: story }, status: 201
    else
      render json: { error: story.errors.full_messages, status: 400 }
    end
  end

  private

  def story_params
    params.require(:story).permit(:summary, :description, :type, :completion_time, :cost)
  end

  def set_users
    @users = User.all
  end
end
