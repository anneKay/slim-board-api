class Api::AuthController < Api::BaseController
  skip_before_action :authorized_user, only: :login

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(auth_params[:password])
      token = JwtProvider.encode('user_id': user.id)
      response.headers['Authorization'] = token
      render json: { message: 'Login successful', user: user }, status: 200 and return
    end

    render json: { error: 'Incorrect username or password'}, status: 401

  end


  private

  def auth_params
    params.permit(:email, :password)
  end
end