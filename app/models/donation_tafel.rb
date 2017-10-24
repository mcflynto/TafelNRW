class DonationTafel < ApplicationRecord
  belongs_to :tafel , optional: true
  belongs_to :donation , optional: true
end
