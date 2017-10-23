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
end
