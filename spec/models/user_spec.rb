require 'rails_helper'

RSpec.describe do
  let(:address) { create(:address) }
  let(:organization) { create(:organization, address: address) }
  let(:user) { create(:user, organization: organization) }
  let(:donator) { create(:donator) }
  let(:transporter) { create(:transporter) }
  let(:donation) { create(:donation, donator: donator, transporter: transporter) }
  let(:share) { create(:share, donation: donation, organization: organization) }

  it 'should test factory setup' do
    expect(donation.amount).to eql(10)
  end
end
