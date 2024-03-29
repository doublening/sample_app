# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  before_save :encrypt_password
  
  EmailRegex=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email
  
  validates_length_of	:name, :maximum=>50
  
  validates_format_of :email, :with=>EmailRegex  
  
  validates_uniqueness_of :email, :case_sensitive=>false
  
  #Automaticallycreatethevirtualattribute'password_confirmation'.
  validates_confirmation_of :password

  #Passwordvalidations.
  validates_presence_of :password
  validates_length_of	:password, :within=>6..40 

  #Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    encrypted_password==encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user=find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  private
  def encrypt_password
    self.salt=make_salt
    self.encrypted_password=encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}#{string}")
  end
 
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
