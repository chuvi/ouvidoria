require 'digest/sha1'

class User < ActiveRecord::Base
	
	attr_protected :id, :salt	
	attr_accessor :password, :password_confirmation
	
	validates_presence_of :name, :login, :email, :password, :password_confirmation, :salt
	validates_length_of :login, :within => 3..40
  validates_length_of :password, :within => 5..40
  validates_uniqueness_of :login, :email
  validates_confirmation_of :password
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  def self.authenticate(login, pass)
    user = User.find(:conditions => {:login => login})
  	return nil if !user  		
	  return user if User.encrypt(pass, u.salt)==user.hashed_password
	  nil
  end  

  def password=(pass)
	  @password=pass
	  self.salt = User.random_string(10) if !self.salt?
	  self.hashed_password = User.encrypt(@password, self.salt)
	end	
	
	protected
	
	def self.encrypt(pass, salt)
		Digest::SHA1.hexdigest(pass+salt)
	end
	
	def self.random_string(len)
	  #generat a random password consisting of strings and digits
	  chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
	  newpass = ""
	  1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
	  return newpass
	end
	
end
	