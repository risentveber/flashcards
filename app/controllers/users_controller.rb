class UsersController < ApplicationController

  skip_before_action :require_login, only: [ :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      auto_login @user
      flash[:success] = 'Успешная регистрация'
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.update_attributes user_params
      flash[:success] = 'Данные успешно изменены'
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def show
  end

  def profile
    render 'show'
  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
