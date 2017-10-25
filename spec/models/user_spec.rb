require 'rails_helper'

RSpec.describe do

  let(:organization) { organization = create(:organization) }
  let(:user) { user = create(:user, organization: organization) }
  let(:donator) { donator = create(:donator) }
  let(:transporter) { transporter = create(:transporter) }
  let(:donation) { donation = create(:donation, donator: donator, transporter: transporter) }
  let(:share) { share = create(:share, donation: donation, organization: organization) }

  it "test factory setup" do
    expect(donation.amount).to eql(10)
  end

end
