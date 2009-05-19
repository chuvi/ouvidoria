namespace :db do
  desc "Cria dados básicos para início da utilização do sistema"
  task :init => [:reset, :environment] do   
    
    user = User.new(:name => 'Admin User', 
      :login => 'admin', :password => 'ouvidoria', :password_confirmation => 'ouvidoria', :email => 'marcia.almeida@camarapoa.rs.gov.br')
    user.save!
    
    puts 'Dados inicializados com sucesso. Assim que possível, cadastre um novo usuário para o sistema.'
    
  end
end