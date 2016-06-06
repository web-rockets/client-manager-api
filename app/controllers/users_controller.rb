class UsersController < ApplicationController
  before_action :authenticate_user

  # GET /users
  def index
    @users = User.all.without_password
    render json: @users
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # PUT/PATCH /users/:id
  def update
    @user = User.find params.require(:id)
    @user.assign_attributes user_params
    return render(json: @user) if @user.save
    return render json: {message: 'not_saved', errors: @user.errors}, status: 400
  end

  # POST /users
  def create
    @user = User.create user_params
    return render(json: @user.errors, status: 400) if @user.invalid?
    render json: @user
  end

  # DELETE /users
  def destroy
    @removed = User.find params.require(:id)
    render json: @removed
  end

  private

  # Retrieve permitted user attributes from params
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
