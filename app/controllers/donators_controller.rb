# Donators Controller
class DonatorsController < ApplicationController
  before_action :check_permission, only: [ :new, :login, :verification, :create ]
  before_action :require_login, only: [ :index]

  def check_permission
    if current_user
      redirect_to donators_path
    end
  end

  def index
    @donator = Donator.all
  end

  def new
    @donator = Donator.new
    @donation = @donator.donations.new
    @address = Address.new
  end

  def login
    @donator = Donator.new
  end

  def ordered
    @donator = Donator.all
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

  def thank_you
    @donator = Donator.find(params[:id])
    @donation = @donator.donations.last
  end

  def create
    @donator = Donator.new(donator_params)
    @donation = @donator.donations.new(donation_params)
    @address = Address.new(donator_params[:address_attributes])
    if @donator.save
      @donation.donation_mail(@donator)
      DonationMailer.donation_email_donator(@donator, @donation).deliver_later
      flash[:success] = 'Spende eingestellt!'
      redirect_to thank_you_donator_path(@donator)
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
