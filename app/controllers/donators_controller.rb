# Donators Controller
class DonatorsController < ApplicationController
  def index
    @donator = Donator.all
  end

  def new
    @donator = Donator.new
    @donation = @donator.donations.new
  end

  def login
    @donator = Donator.new
  end

  def verification
    @donator = Donator.where(email: donator_params[:email]).first

    if @donator
      redirect_to donator_donations_path(@donator)
    else
      @donator = Donator.new
      render :login
    end
  end

  def create
    @donator = Donator.new(donator_params)
    @donation = @donator.donations.new(donation_params)

    if @donator.save
      @donator.donations.last.donation_mail(@donator)
      DonationMailer.donation_email_donator(@donator, @donator.donations.last).deliver_now
      flash[:success] = 'Spende eingestellt!'
      redirect_to donator_donations_path(@donator)

    else
      flash[:error] = 'Es ist ein Fehler aufgetreteten'
      render :new
    end
  end

  private

  def donator_params
    params.require(:donator).permit(
      :name,
      :email,
      { address_attributes:
        %i[street house_number city plz phone] }
    )
  end

  def donation_params
    params.require(:donator).require(:donations_attributes).permit(:food, :amount, :unit, :expiry_date)
  end
end
