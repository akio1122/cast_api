class Api::V1::UsersController < Api::V1::BaseController
  before_action :authorize, except: :create

  def create
    @user = CreateUser.call(user_params: user_params)
    if @user.valid?
      respond_with :api, :v1, @user
    else
      if @user.errors.messages.keys.include? :oauth
        render json: 'Failed to get facebook information', status: :unprocessable_entity
      elsif @user.errors.messages.keys.include?(:facebook_id) || @user.errors.messages.keys.include?(:amazon_id)
        render json: 'Invalid facebook/amazon id information', status: :unprocessable_entity
      else
        respond_with :api, :v1, @user
      end
    end

  end

  def update
    result = UpdateUser.call(user: @current_user, id: params[:id], user_params: user_params)
    if result[:success]
      render *result[:render_arguments]
    else
      render_unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password, :age, :hair_type, :skin_type, :latitude, :longitude, :installation_id,
                  :facebook_id, :facebook_session, :amazon_id, :amazon_session, :avatar, :content_type, :filename)
  end
end
