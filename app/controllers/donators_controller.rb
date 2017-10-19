# Donators Controller
class DonatorsController < ApplicationController
  def new
    @donator = Donator.new
  end

  def create
    @donator = Donator.new(donator_params)

    if @donator.save
      flash[:success] = 'Spende eingestellt!'
      redirect_to donations_path

    else
      flash[:error] = 'Es ist ein Fehler aufgetreteten'
      render new
    end
  end

  private

  def donator_params
    params.require(:donator).permit(:name, :email)
  end
end
