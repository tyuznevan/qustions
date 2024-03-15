class UsersController < ApplicationController


  def new
    session[:current_time]=Time.now
    @user = User.new
  end

  def create
    @user=User.create(user_params)

    #flash[:notice] = 'Новый пользователь создан! '
    redirect_to root_path, notice: 'Новый пользователь создан! '
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end

end
