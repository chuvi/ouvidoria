class Destino < ActiveRecord::Base
  
  validates_presence_of :nome,  :status, :tipo	  
 # validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  TIPOS = [:Funcionario, :Parlamentar, :Setor ]
  
  named_scope :search, lambda { |text| {:conditions => ["nome LIKE ?", "%#{text}%"]} }
  
  
  def validates_email(email)
	end
  
end