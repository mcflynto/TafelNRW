class Adress < ApplicationRecord
  belongs_to :tafel
  belongs_to :donator
  belongs_to :transpoter
end
