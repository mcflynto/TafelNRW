require 'rails_helper'

RSpec.describe do
  let(:tafel) { tafel = create(:tafel) }
  let(:user) { user = create(:user, tafel_id: tafel.id) }
  let(:donator) { donator = create(:donator) }
  let(:transporter) { transporter = create(:transporter) }
  #let(:address) { address = create(:address, :tafel_address, addressable_id: tafel.id) }
  let(:donation) { donation = create(:donation, donator_id: donator.id, transporter_id: transporter.id) }


  it "test factory setup" do
    expect(donation.amount).to eql(10)
  end

end
