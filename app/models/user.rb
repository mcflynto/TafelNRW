class User < ApplicationRecord
  authenticates_with_sorcery!
  before_create :setup_activation
  belongs_to :organization
  validates_presence_of :first_name, :email ,:organization, :last_name


  validates :email, uniqueness: true
  validates :password, :presence => true, :confirmation => true, :on => :update
  validates :password, length: { minimum: 3 }, :on => :update



  def is_admin?
    if self.admin == true
      true
    else
      false
    end
  end
end
