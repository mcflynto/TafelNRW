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

  def create_password
    @user = user.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Neuer Nutzer konnte angelegt werden"
      UserMailer.welcome_mail(@user).deliver_now
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
    params.require(:user).permit(:email, :name, :admin, :tafel_id)
  end
end
