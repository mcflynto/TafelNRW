class Donation < ApplicationRecord
  belongs_to :donator
  belongs_to :transporter
  has_and_belongs_to_many :tafels
end
