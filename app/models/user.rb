class User < ApplicationRecord
  authenticates_with_sorcery!
  #scope :user_tafel, -> (tafelid) { where('tafel_id', tafelid) }
  before_create :setup_activation

  validates :email, uniqueness: true
  def is_admin?
    if self.admin == true
      true
    else
      false
    end
  end

  def users_tafel
    User.where(tafel_id: self.tafel_id).all
  end
end
