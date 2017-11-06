require 'rails_helper'

RSpec.describe do
  let(:address) { create(:address) }
  let(:transporter) { create(:transporter, address: address) }

  it 'should test the successful creation of a transporter token' do
    transporter.create_transporter_token
    expect(transporter.transporter_hash).not_to eq(nil)
  end
end
