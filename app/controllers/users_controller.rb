class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def alluser
    @user = User.order(:name).all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @token = params[:id]
    else
      not_authenticated
    end
  end

  def confirm
    @token = params[:user][:activation_token]
    if @user = User.load_from_activation_token(@token)
      if @user.update_attributes(user_params)
        @user.activate!
        redirect_to new_session_path, :notice => 'Your account is now activated.'
      else
        render :activate
      end
    else
      not_authenticated
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Neuer Nutzer konnte angelegt werden"
      UserMailer.activation_needed_email(@user).deliver_now
      redirect_to users_path
    else
      flash[:notice] = "Neuer Nutzer konnte nicht erstellt werden"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Nutzer wurde gelöscht"

    else
      flash[:notice] = "Nutzer konnte nicht gelöscht werden"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(user_params)

    if @user.update(user_params)
      flash[:notice] = "Nutzer wurde verändert"
    else
      flash[:notice] = "Nutzer wurde nicht verändert"
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :name, :admin, :tafel_id, :password, :password_confirmation)
  end
end
