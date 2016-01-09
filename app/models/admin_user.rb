class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_initialize :set_data
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  has_many :tickets

  private
  def set_data
    self.email = "admin@example.com"
    self.password = Digest::MD5.hexdigest "password"
  end
end
