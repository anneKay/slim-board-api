class Api::UsersController < Api::BaseController
  skip_before_action :authorized_user, only: :create

  def create
    @user = User.create(user_params)
    if @user.persisted?
      payload = { user_id: @user.id }
      token = JwtProvider.encode(payload)
      response.headers['Authorization'] = token
      json_response(@user, :created)
    else
      json_response({ error: @user.errors.full_messages },  :bad_request)
    end
      
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end
end