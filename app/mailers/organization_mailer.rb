class OrganizationMailer < ApplicationMailer
  default from: 'tafeltest@gmail.com'

  def transport_confirmed_mail(donation, share)
    @donation = donation
    @donator = @donation.donator
    @share = share
    @organization = @share.organization
    @transporter = @donation.transporter

    mail(to: @organization.email, subject: 'Transport bestätigt')
  end
end
