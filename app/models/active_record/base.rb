module ActiveRecord
  class Base
    #Metodo initialize que crea variables dinamicas 
    def initialize(params = {})
      params.each do   |key,value|
        instance_variable_set("@#{key}",value) #Metodo que toma una variable de instacia y la crea con su valor
        self.class.send(:define_method,key) do #:define_method crea un motodo para traer los valores
          instance_variable_get("@#{key}")
        end
      end
    end

    def save
      
    end

    def self.create(params)
      #Capturamos las columnas  dinicas qe llega en el hash que llega en el params
      columns = params.keys.join(', ')
      values = params.values.map {|v| "'#{v}'"}.join(', ')
      query= "insert into #{tableName} (#{columns}) values (#{values});"
      execute_query(query)
    end

    def self.client
      #instaciamos la clase client que tiene la coneccion y el query
      # si la variable tiene un ||= si la variable esta vacia le asigna el valor si esta llena la deja tal cual
      $client ||= ActiveRecord::Client.new 
    end

    def  self.execute_query(query='')
      client.execute_query(query)
    end

     #metodo que devuelve un registro si lo encuentra
     def self.find(id)
        results = execute_query("select * from #{tableName} where id = #{id};")
        #Capturamos un error en caso de que el id no exista
        raise("RecordNotFound") if results.cmd_tuples.zero?
        #generamos una instacia del primer registro
        new(results.each.first)

     end

    #Metodo que devuelve todos los registros
    def self.all
      results = execute_query("select * from #{tableName};") # definimos la sentencia select para traer todos los registros
      results.each.map { |row| new(row) } #devuelve
    end

    def self.destroy(id)
       results= execute_query("delete from #{tableName} where id = #{id};")
       raise("RecordNotFound") if results.cmd_tuples.zero?
       true
       
    end

   

    def self.tableName
      raise("NotImplementedError")
    end
  
  end
end
