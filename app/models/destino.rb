class Destino < ActiveRecord::Base
  
  validates_presence_of :nome, :email, :status	  
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
end