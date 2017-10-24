class DonationTafelsController < ApplicationController
  def create
    @donation = Donation.find(params[:donation_id])
    @donation_tafel = @donation.donation_tafels.new(donation_tafel_params)
    @donation_tafel.tafel = current_user.tafel


    if @donation_tafel.save
      flash[:notice] = "Neue Spende für diese Tafel wurde angelegt"
      @donation.change_amount(@donation_tafel.amount)
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Es konnte keine neue Spende angelegt werden"
      redirect_to donation_path(@donation)
    end
  end

  def update
    @donation_tafel = DonationTafel.find(params[:id])
    @amount = @donation_tafel.amount
    @donation = Donation.find(params[:donation_id])
    if @donation_tafel.update(donation_tafel_params)
      flash[:notice] = "Spende konnte geändert werden"
      @donation.update_amount(@amount, @donation_tafel.amount)
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Spende konnte nicht geändert werden"
      redirect_to donation_path(@donation)
    end
  end
private
  def donation_tafel_params
    params.require(:donation_tafel).permit(:amount)
  end
end
