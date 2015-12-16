class Email < ActiveRecord::Base
  validates_presence_of :email, :email_token
end
