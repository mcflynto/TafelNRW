# Transporter Model
class Transporter < ApplicationRecord
  has_many :donations
  has_one :address, as: :addressable
  accepts_nested_attributes_for :address

  validates_presence_of :name, :email
  validates :email, uniqueness: true

  def create_transporter_hash
    self.transporter_hash = loop do
      transporter_hash = SecureRandom.urlsafe_base64(nil, false)
      break transporter_hash unless
        Transporter.exists?(transporter_hash: transporter_hash)
    end
  end
end
