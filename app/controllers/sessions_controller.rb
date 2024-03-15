class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:sessions)

    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'Вы вошли на сайт'
    else
      flash.now[:alert] = 'Неправильный пароль или email'
      render :new
    end
  end

  def destroy
    sessions.delete(:user_id)
    redirect_to root_path, notice: 'Вы вышли из аккаунта!'
  end

end
