class User < ApplicationRecord
  authenticates_with_sorcery!
  before_create :setup_activation
  belongs_to :organization

  validates :email, uniqueness: true
  def is_admin?
    if self.admin == true
      true
    else
      false
    end
  end
end
