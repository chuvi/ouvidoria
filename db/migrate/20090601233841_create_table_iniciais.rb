	create_table :users do |t|
    t.string		:name		
    t.string		:login
    t.string		:hashed_password
    t.string		:email
    t.string		:salt
    t.date      :created_at
    t.integer   :created_by
    t.date      :update_at
    t.integer   :updated_by
  end  
  
  create_table :destinos do |t|
    t.string    :nome
    t.string    :email
    t.string    :status      
    t.date      :created_at
    t.integer   :created_by
    t.date      :update_at
    t.integer   :updated_by
  end  
  
  create_table  :demandas do |t|
    t.string  :demandante
    t.string  :email
    t.string  :endereco
    t.string  :telefone
    t.string  :celular
    t.string  :status
    t.date    :created_at
    t.integer :created_by
    t.date    :update_at
    t.integer :updated_by
  end
  
  create_table  :historico do |t|    
    t.date    :data
    t.string  :descricao    
    t.date    :created_at
    t.integer :created_by
    t.date    :update_at
    t.integer :updated_by
  end