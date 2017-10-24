# Donations Controller
class DonationsController < ApplicationController

  def index
    @donator = Donator.find(params[:donator_id])
    @donations = @donator.donations
  end

  def show
    @donation = Donation.find(params[:id])
    @donator = Donator.find(@donation.donator_id)
    @donation_tafel = DonationTafel.new
    @d_tafel = DonationTafel.where(tafels_id: current_user.tafel_id).first
  end
end
