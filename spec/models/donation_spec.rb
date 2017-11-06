require 'rails_helper'

RSpec.describe do
  let(:address) { create(:address) }
  let(:donator) { create(:donator, address: address) }
  let!(:donation) { create(:donation, donator: donator) }

  it 'should test donation scopes' do
    expect(Donation.open_donation.length).to eq(1)
  end

  it 'should have a valid date' do
    donation.expiry_date = Date.today - 5.days
    donation.valid_date?
    expect(donation.errors.messages).not_to eq({})
  end
end
