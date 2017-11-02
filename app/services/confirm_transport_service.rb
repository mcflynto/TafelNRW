# Sends confirmation mails for a donation to every participating party
class ConfirmTransportService
  def initialize(donation, shares)
    @donation = donation
    @shares = shares
  end

  def send_transport_confirmation
    TransporterMailer.transport_confirmed_mail(@donation).deliver_later
    DonatorMailer.transport_confirmed_mail(@donation).deliver_later
    @shares.each do |share|
      OrganizationMailer.transport_confirmed_mail(@donation, share).deliver_later
    end
  end

  def send_transporter_email
    Transporter.each do |trans|
      TransporterMailer.transporter_email(@donation, @donator, trans).deliver_later
    end
  end

  private

  attr_reader :donation, :shares
end
