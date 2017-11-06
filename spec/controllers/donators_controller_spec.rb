require 'rails_helper'

RSpec.describe DonatorsController, type: :controller do
  let!(:address) { create(:address) }
  let!(:address2) { create(:address) }
  let!(:address3) { create(:address) }
  let!(:organization) { create(:organization, address: address) }
  let!(:user) { create(:user, organization: organization) }
  let!(:donator) { create(:donator, address: address2) }
  let!(:transporter) { create(:transporter, address: address3) }
  let!(:donation) do
    create(:donation, donator: donator,
                      transporter: transporter)
  end
  let!(:share) do
    create(:share, donation: donation,
                   organization: organization)
  end

  it 'should render new' do
    get :new
    expect(response).to render_template('new')
  end
end
