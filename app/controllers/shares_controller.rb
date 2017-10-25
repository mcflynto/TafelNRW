class SharesController < ApplicationController
  before_action :require_login
  def edit
    @donation = Donation.find(params[:donation_id])
    @share = @donation.shares.find(params[:id])

  end

  def create
    @donation = Donation.find(params[:donation_id])
    @share = @donation.shares.new(share_params)
    @share.organization = current_user.organization

    if @share.save
      flash[:notice] = "Neue Spende für diese Tafel wurde angelegt"
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Es konnte keine neue Spende angelegt werden"
      redirect_to donation_path(@donation)
    end
  end

  def update
    @donation = Donation.find(params[:donation_id])
    @share = @donation.shares.find(params[:id])

    @amount = @share.amount
    if @share.update(share_params)
      flash[:notice] = "Spende konnte geändert werden"
      redirect_to donation_path(@donation)
    else
      flash[:notice] = "Spende konnte nicht geändert werden"
      redirect_to donation_path(@donation)
    end
  end

  def pickup
    @donation = Donation.find(params[:donation_id])
    @share = @donation.shares.find(params[:id])
    @organization = current_user.organization
    @donator = @donation.donator
    if @share.update(share_params)
      flash[:notice] = "Selbstabholung spende ist Angefragt"
      DonatorMailer.pickup_email(@donation, @organization, @donator, @share).deliver_now
      redirect_to donators_path

    else
      render :edit
    end

  end

  private

  def share_params
    params.require(:share).permit(:amount , :pick_up, :pick_up_date)
  end
end
