class SharesController < ApplicationController

  def create
    @donation = Donation.find(params[:donation_id])
    @share = Share.new(share_params)
    @share.donation = @donation
    @share.organization = current_user.organization

    if @share.save
      flash[:notice] = "Neue Spende für diese Tafel wurde angelegt"
      @donation.change_amount(@share.amount)
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Es konnte keine neue Spende angelegt werden"
      redirect_to donation_path(@donation)
    end
  end

  def update
    @share = Share.find(params[:id])
    @donation = @share.donation
    @amount = @share.amount
    if @share.update(share_params)
      flash[:notice] = "Spende konnte geändert werden"
      @donation.update_amount(@amount, @share.amount)
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Spende konnte nicht geändert werden"
      redirect_to donation_path(@donation)
    end
  end

  private

  def share_params
    params.require(:share).permit(:amount , :pick_up)
  end
end
