class Share < ApplicationRecord
  belongs_to :organization
  belongs_to :donation
end
