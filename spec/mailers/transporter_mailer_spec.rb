require 'rails_helper'

RSpec.describe TransporterMailer, type: :mailer do
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

  let!(:mail) { TransporterMailer.transporter_email(donation, donator, transporter) }

  it 'should render the headers of the transporter email' do
    expect(mail.subject).to eq('Transport angefordert')
    expect(mail.to).to eq([transporter.email])
    expect(mail.from).to eq(['tafeltest@gmail.com'])
  end

  let!(:mail2) { TransporterMailer.transport_confirmed_mail(donation) }

  it 'should render the headers of the transport confirmed email' do
    expect(mail2.subject).to eq('Transport bestätigt')
    expect(mail2.to).to eq([transporter.email])
    expect(mail2.from).to eq(['tafeltest@gmail.com'])
  end
end
