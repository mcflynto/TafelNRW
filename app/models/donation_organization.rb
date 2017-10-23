class DonationOrganization < ApplicationRecord
  belongs_to :organization
  belongs_to :donation
end
