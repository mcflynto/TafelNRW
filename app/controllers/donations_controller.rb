# Donations Controller
class DonationsController < ApplicationController
  def index
    @donator = Donator.find(params[:donator_id])
    @donations = @donator.donations
  end

  def show
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
    @donation_organization = DonationOrganization.new
  end

  def delivery
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
    @organizations = 'participating organizations'
    @transporter = Transporter.all
    @transporter.each do |trans|
      TransporterMailer.transporter_email(@donation, @donator,
                                          @organizations, trans).deliver_later
    end
    redirect_to donation_path(@donation)
  end
end
