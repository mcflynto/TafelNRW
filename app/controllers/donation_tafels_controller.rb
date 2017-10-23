class DonationTafelsController < ApplicationController
  def create
    @donation_tafel = DonationTafel.new(donation_tafel_params)
    @donation_tafel.tafels_id = current_user.tafel_id
    @donation_tafel.donations_id = params[:donation_id]
    if @donation_tafel.save
      flash[:notice] = "Neue Spende für diese Tafel wurde angelegt"
    else
      flash[:notice] = "Es konnte keine neue Spende angelegt werden"
    end
  end
private
  def donation_tafel_params
    params.require(:donation_tafel).permit(:amount)
  end
end
