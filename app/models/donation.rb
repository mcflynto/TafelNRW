class Donation < ApplicationRecord
  belongs_to :donator, optional: true
  belongs_to :transporter, optional: true
  has_and_belongs_to_many :tafels
end
