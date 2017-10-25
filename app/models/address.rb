class Address < ApplicationRecord
  belongs_to :addressable, optional: true, polymorphic: true
  validates_presence_of :street, :city, :house_number, :plz
end
