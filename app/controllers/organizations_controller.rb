class OrganizationsController < ApplicationController
  before_action :require_login
  def index
    @organization = Organization.all
  end

  def edit
    @organization = Organization.find(params[:id])
    @address = @organization.address
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      flash[:notice] = "Neue Organisation wurde erstellt"
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      redirect_to organizations_path
    else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(
      :name,
      :email,
      { address_attributes:
        %i[street house_number city plz phone] }
    )
  end
end
