class Demanda < ActiveRecord::Base
	
	belongs_to :destino
	
	validates_presence_of	:demandante
	
	before_create Proc.new{|record| record.status = 'pendente'}	

	
	STATUS = [['Em Atendimento',:em_atendimento],
	  ['Finalizada Sem Solução',:finalizada_sem_solucao],		
		['Pendente',:pendente],		
		['Resolvida',:resolvida]]
		
	def validate
		#ao menos uma forma de contato de ve ser informada
	end
		
	def self.search(params)
		conditions =  []
		conditions << "demandante like '%#{params[:demandante]}%'"
		conditions << "id like '%#{params[:numero]}%'"
		conditions << "status like '%#{params[:status]}%'"		
		Demanda.all(:conditions => conditions.join(' AND '), :order => :created_at)				
	end
	
		
		
end