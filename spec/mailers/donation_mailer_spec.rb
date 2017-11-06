require 'rails_helper'

RSpec.describe DonationMailer, type: :mailer do
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

  it 'should send email to all organizations' do
    org = donation.donation_mail(donator)
    mail = DonationMailer.donation_email(donation, org[0], donator)
    expect(mail.subject).to eq('Neue Spende')
    expect(mail.to).to eq([org[0].email])
    expect(mail.from).to eq(['tafeltest@gmail.com'])
  end

  let!(:mail2) { DonationMailer.donation_email_donator(donator, donation) }
  it 'should send email to donator' do
    expect(mail2.subject).to eq('Deine Spende')
    expect(mail2.to).to eq([donator.email])
    expect(mail2.from).to eq(['tafeltest@gmail.com'])
  end
end
