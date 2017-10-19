class SessionsController < ApplicationController
  def new
  end

  def create
   @user = login(session_params[:email], session_params[:password])

    if @user
      flash[:succes] = "Login hat funktioniert"
      redirect_to users_path
    else
      flash[:error] = "Login hat nicht funktioniert"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_path
    flash[:notice] = 'user wurde ausgeloggt'
  end
private
  def session_params
    params.require(:session).permit(:email, :password)
  end

end
