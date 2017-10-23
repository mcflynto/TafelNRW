class DonationTafel < ApplicationRecord
  belongs_to :tafel
  belongs_to :donation
end
