class Api::UsersController < Api::BaseController
  skip_before_action :authorized_user, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      payload = { user_id: @user.id }
      token = JwtProvider.encode(payload)
      response.headers['Authorization'] = token
      render json: { message: 'successfully signed up', data: User.user_json(@user)}, status: 201
    else
      render json: { error: @user.errors.full_messages, status: 400 }
    end
      
  end

  private

  def user_params
    params.permit(:email, :name, :password)
  end
end