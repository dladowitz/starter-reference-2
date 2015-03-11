class UsersController < ApplicationController
  def new
    @user = User.new

    render layout: "landing_page/landing_layout"
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "User account created successfully"
      redirect_to signin_path
    else
      render :new
    end
  end

  def show
    @page_name = "Homepage"
    @user = User.find_by_id params[:id]

    if @user
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
