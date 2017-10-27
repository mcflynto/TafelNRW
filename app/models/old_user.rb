class User < ApplicationRecord
  belongs_to :organization
  validates_presence_of :name, :email ,:organization
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

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
