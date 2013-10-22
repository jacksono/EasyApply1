class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email_address, :password,  :confirm_password 
  validates_presence_of :first_name, :last_name, :email_address, :password, :confirm_password #to avoid blank fields
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i #gives format for a valid email address
  validates_uniqueness_of :email_address, {:message=> ": THE ACCOUNT EXISTS"} #checks if a similar email address exists
  validates_format_of :email_address, {with: VALID_EMAIL_REGEX} #checks if a valid email is entered
  validate :passwords_equal? #calls a private method to check is the passwords enetered are the same

  def passwords_equal? #defines method for comparing :password and :confirm_password
  	@errors.add(:password, ": The passwords do not match") if self.password != self.confirm_password
  end


end
