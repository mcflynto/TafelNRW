# Donations Controller
class DonationsController < ApplicationController
  def index
    @donator = Donator.find(params[:donator_id])
    @donations = @donator.donations
  end

  def new
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.new
  end

  def create
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.new(donation_params)
    if @donation.save
      redirect_to donator_donations_path(@donator)
    else
      render :new
    end
  end

  def update
    @donation = Donation.find(params[:id])
    if @donation.update(transporter_donation_params)
      redirect_to transport_donation_path(@donation)
    else
      render :transport
    end
  end

  def show
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
    @share = Share.new
    @share_organization = @donation.shares.where(organization: current_user.organization).first
    @shares = @donation.shares.all
  end

  def delivery
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
    @transporter = Transporter.all
    @transporter.each do |trans|
      TransporterMailer.transporter_email(@donation, @donator,
                                          trans).deliver_later
    end
    redirect_to donation_path(@donation)
  end


  def transport
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
    @shares = @donation.shares
  end

  def confirm_transport
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
    @shares = @donation.shares

    @donation.update(confirmed: true)
    redirect_to transport_donation_path(@donation)
  end

  private

  def donation_params
    params.require(:donation).permit(:food, :amount, :unit, :expiry_date)
  end

  def transporter_donation_params
    params.require(:donation).permit(:delivery_date)
  end
end
