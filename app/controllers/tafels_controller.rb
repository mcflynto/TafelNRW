class TafelsController < ApplicationController
  def index
    @tafel = Tafel.all
  end

  def edit
    @tafel = Tafel.find(params[:id])
    @address = @tafel.address
  end

  def new
    @tafel = Tafel.new
  end

  def create
    @tafel = Tafel.new(tafel_params)

    if @tafel.save
      flash[:notice] = "Neue Tafel wurde erstellt"
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    @tafel = Tafel.find(params[:id])

    if @tafel.update(tafel_params)
      redirect_to tafels_path
    else
      render :edit
    end
  end
private
  def tafel_params
    params.require(:tafel).permit(
      :name,
      :email,
      { address_attributes:
        %i[street house_number city plz phone] }
    )
  end
end
