class Transporter < ApplicationRecord
  has_many :donations
  has_and_belongs_to_many :tafels
  belongs_to :address
end
