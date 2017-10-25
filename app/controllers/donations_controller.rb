# Donations Controller
class DonationsController < ApplicationController
  before_action :require_login, only:[:show ,:delivery, :transport, :confirm_transport ]
  def index
    @donator = Donator.find(params[:donator_id])
    @donations = @donator.donations
  end

  def new
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.new
  end

  def edit
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.find(params[:id])
  end

  def update
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.find(params[:id])

    if @donation.update(donation_params)
      redirect_to donator_donations_path(@donator)
    else
      render :edit
    end
  end

  def create
    @donator = Donator.find(params[:donator_id])
    @donation = @donator.donations.new(donation_params)
    if @donation.save
      @donation.donation_mail(@donator)
      DonationMailer.donation_email_donator(@donator, @donation).deliver_now
      redirect_to donator_donations_path(@donator)

    else
      render :new
    end
  end

  def update_transport
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

  def show_donator
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
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
    # TODO: find the right transporter by email link
    @transporter = Transporter.find(1)
    @donation.transporter = @transporter

    TransporterMailer.transport_confirmed_mail(@donation).deliver_later
    DonatorMailer.transport_confirmed_mail(@donation).deliver_later
    @shares.each do |share|
      OrganizationMailer.transport_confirmed_mail(@donation, share).deliver_later
    end

    # TODO: put back in after testing:
    # @donation.update(confirmed: true)
    redirect_to transport_donation_path(@donation)
  end

  private

  def donation_params
    params.require(:donation).permit(:food, :amount, :unit, :expiry_date , :delivery_date)
  end

  def transporter_donation_params
    params.require(:donation).permit(:delivery_date)
  end
end
