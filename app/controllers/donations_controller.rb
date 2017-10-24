# Donations Controller
class DonationsController < ApplicationController
  def index
    @donator = Donator.find(params[:donator_id])
    @donations = @donator.donations
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
    @organizations = 'participating organizations'
    @transporter = Transporter.all
    @transporter.each do |trans|
      TransporterMailer.transporter_email(@donation, @donator,
                                          @organizations, trans).deliver_later
    end
    redirect_to donation_path(@donation)
  end

  def transport
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
    @shares = Share.where(donation_id: @donation)
  end

  def confirm_transport
    @donation = Donation.find(params[:id])
    @donator = @donation.donator
    @shares = @donation.shares


    @donation.update(confirmed: true)
    redirect_to transport_donation_path(@donation)
  end
end
