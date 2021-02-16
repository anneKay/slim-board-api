class StoriesController < Api::BaseController

  private

  def story_params
    params.require(:story).permit(:summary, :description, :type, :completion_time, :cost, :tenant_id)
  end

end
