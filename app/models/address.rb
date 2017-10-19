class Address < ApplicationRecord
  belongs_to :addressable, optional: true, polymorphic: true
end
