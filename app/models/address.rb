class Address < ApplicationRecord
  has_one :tafel
  has_one :donator
  has_one :transporter
end
