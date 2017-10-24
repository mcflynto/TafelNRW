class DonationOrganizationsController < ApplicationController
  def create
    @donation_organization = DonationOrganization.new(donation_organization_params)
    @donation_organization.organizations_id = current_user.organization_id
    @donation_organization.donations_id = params[:donation_id]
    if @donation_organization.save
      flash[:notice] = 'Neue Spende für diese Organisation wurde angelegt'
    else
      flash[:notice] = 'Es konnte keine neue Spende angelegt werden'
    end
  end

  private

  def donation_organization_params
    params.require(:donation_organization).permit(:amount)
  end
end
